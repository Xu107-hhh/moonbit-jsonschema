///|
/// Validate an instance against a JSON Schema (2020-12).
///
/// The schema must be a `Json` boolean or object, as produced by
/// `@json.parse`. On failure, returns *all* collected errors, each carrying
/// the instance path and schema path of the failure (JSON Pointer, RFC 6901).
pub fn validate(
  schema : Json,
  instance : Json,
) -> Result[Unit, Array[ValidationError]] {
  validate_with_docs(schema, instance, {})
}

///|
/// Validate with additional external documents available for `$ref`
/// resolution, keyed by their absolute URI (their embedded `$id`s are
/// registered as well). This is how multi-file schemas are validated
/// without any network access.
pub fn validate_with_docs(
  schema : Json,
  instance : Json,
  docs : Map[String, Json],
) -> Result[Unit, Array[ValidationError]] {
  // the root resource's own $id provides the initial base URI
  let root_base : String = if schema is Object(o) &&
    o.get("$id") is Some(String(id)) {
    uri_join("", id)
  } else {
    ""
  }
  let ctx : Ctx = {
    root: schema,
    errors: [],
    regex_cache: {},
    depth: 0,
    anno_stack: [Annos::empty()],
    resource_stack: [schema],
    docs,
    ids: {},
    ids_built: false,
    jumped: 0,
    id_stack: [root_base],
  }
  for uri, doc in docs {
    if ctx.ids.get(uri) is None {
      ctx.ids.set(uri, doc)
    }
    let _ = collect_ids(doc, uri, ctx.ids)
  }
  validate_node(ctx, schema, instance, PRoot, PRoot)
  if ctx.errors.length() == 0 {
    Ok(())
  } else {
    Err(ctx.errors)
  }
}

///|
/// Boolean convenience over `validate`.
pub fn is_valid(schema : Json, instance : Json) -> Bool {
  validate(schema, instance) is Ok(_)
}

///|
/// Parse two JSON texts, then validate the instance against the schema.
/// Parse failures are reported separately from validation failures.
pub fn validate_json(
  schema_text : String,
  instance_text : String,
) -> Result[Unit, JsonSchemaError] {
  let schema : Json = @json.parse(schema_text) catch {
    e => return Err(SchemaParseError(e.to_string()))
  }
  let instance : Json = @json.parse(instance_text) catch {
    e => return Err(InstanceParseError(e.to_string()))
  }
  match validate(schema, instance) {
    Ok(_) => Ok(())
    Err(errors) => Err(ValidationErrors(errors))
  }
}

///|
/// Dispatch a schema node against an instance value.
fn validate_node(
  ctx : Ctx,
  schema : Json,
  inst : Json,
  ip : Path,
  sp : Path,
) -> Unit {
  ctx.depth = ctx.depth + 1
  if ctx.depth > MAX_DEPTH {
    ctx.add_error(
      ip, sp, "max_depth", "maximum schema recursion depth exceeded (possible cyclic $ref)",
    )
    ctx.depth = ctx.depth - 1
    return
  }
  match schema {
    True => ()
    False =>
      ctx.add_error(
        ip, sp, "boolean_schema", "schema `false` accepts no values",
      )
    Object(obj) => {
      // track $id base URIs and resource scopes on the way in
      let pushed_id = ctx.push_id(schema)
      kw_ref(ctx, obj, inst, ip, sp)
      kw_type_enum_const(ctx, obj, inst, ip, sp)
      kw_numeric(ctx, obj, inst, ip, sp)
      kw_string(ctx, obj, inst, ip, sp)
      kw_array(ctx, obj, inst, ip, sp)
      kw_object(ctx, obj, inst, ip, sp)
      kw_logic(ctx, obj, inst, ip, sp)
      // unevaluated* must run after every other applicator has had a
      // chance to record its annotations for this instance location
      kw_unevaluated(ctx, obj, inst, ip, sp)
      if pushed_id {
        let _ = ctx.id_stack.pop()
        let _ = ctx.resource_stack.pop()
      }
    }
    _ => () // schemas must be objects or booleans; anything else is ignored
  }
  ctx.depth = ctx.depth - 1
}
