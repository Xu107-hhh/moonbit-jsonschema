///|
/// Array keywords: prefixItems, items, maxItems, minItems, uniqueItems,
/// contains, minContains, maxContains (2020-12).
fn kw_array(
  ctx : Ctx,
  obj : Map[String, Json],
  inst : Json,
  ip : Path,
  sp : Path,
) -> Unit {
  guard inst is Array(items) else { return }
  let len = items.length()
  match obj.get("maxItems") {
    Some(Number(m, ..)) =>
      if len > m.to_int() {
        ctx.add_error(
          ip,
          sp.key("maxItems"),
          "maxItems",
          "array has \{len} items, more than maxItems \{m.to_int()}",
        )
      }
    _ => ()
  }
  match obj.get("minItems") {
    Some(Number(m, ..)) =>
      if len < m.to_int() {
        ctx.add_error(
          ip,
          sp.key("minItems"),
          "minItems",
          "array has \{len} items, fewer than minItems \{m.to_int()}",
        )
      }
    _ => ()
  }
  // prefixItems applies to the leading positions; items applies to the rest.
  let mut prefix = 0
  let ip_str = render_path(ip)
  match obj.get("prefixItems") {
    Some(Array(schemas)) => {
      prefix = schemas.length()
      let bound = if prefix < len { prefix } else { len }
      for i in 0..<bound {
        validate_node(
          ctx,
          schemas[i],
          items[i],
          ip.idx(i),
          sp.key("prefixItems").idx(i),
        )
        ctx.note_item(ip_str, i)
      }
    }
    _ => ()
  }
  match obj.get("items") {
    Some(schema) =>
      for i in prefix..<len {
        validate_node(ctx, schema, items[i], ip.idx(i), sp.key("items"))
        ctx.note_item(ip_str, i)
      }
    None => ()
  }
  match obj.get("uniqueItems") {
    Some(True) => {
      let mut i = 0
      let mut j = 0
      let mut dup = false
      while i < len && !dup {
        j = i + 1
        while j < len && !dup {
          if items[i] == items[j] {
            ctx.add_error(
              ip.idx(j),
              sp.key("uniqueItems"),
              "uniqueItems",
              "array items are not unique (items \{i} and \{j} are equal)",
            )
            dup = true
          }
          j = j + 1
        }
        i = i + 1
      }
    }
    _ => ()
  }
  // contains: at least minContains (default 1 when `contains` is present)
  // and at most maxContains elements must match the contains-schema.
  match obj.get("contains") {
    Some(contains_schema) => {
      let mut matched = 0
      for i in 0..<len {
        if ctx.probe(contains_schema, items[i], ip.idx(i), sp.key("contains")) {
          matched = matched + 1
          // a matched element counts as evaluated for unevaluatedItems
          ctx.note_item(ip_str, i)
        }
      }
      let min = match obj.get("minContains") {
        Some(Number(m, ..)) => m.to_int()
        _ => 1
      }
      if matched < min {
        ctx.add_error(
          ip,
          sp.key("contains"),
          "contains",
          "\{matched} elements match `contains`, fewer than minContains \{min}",
        )
      }
      match obj.get("maxContains") {
        Some(Number(m, ..)) =>
          if matched > m.to_int() {
            ctx.add_error(
              ip,
              sp.key("maxContains"),
              "maxContains",
              "\{matched} elements match `contains`, more than maxContains \{m.to_int()}",
            )
          }
        _ => ()
      }
    }
    None => ()
  }
}
