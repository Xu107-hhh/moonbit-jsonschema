///|
/// Does this object key match a `patternProperties` regex?
fn key_matches_pattern(ctx : Ctx, pattern : String, key : String) -> Bool {
  match ctx.regex(pattern) {
    Some(re) => re.match_(key) is Some(_)
    None => false
  }
}

///|
/// Object keywords: properties, patternProperties, additionalProperties,
/// required, minProperties, maxProperties, propertyNames,
/// dependentRequired, dependentSchemas.
fn kw_object(
  ctx : Ctx,
  obj : Map[String, Json],
  inst : Json,
  ip : Path,
  sp : Path,
) -> Unit {
  guard inst is Object(props) else { return }
  let prop_defs : Map[String, Json] = match obj.get("properties") {
    Some(Object(m)) => m
    _ => {}
  }
  let pattern_defs : Map[String, Json] = match obj.get("patternProperties") {
    Some(Object(m)) => m
    _ => {}
  }
  let required : Array[String] = match obj.get("required") {
    Some(Array(items)) => {
      let names = []
      for item in items {
        if item is String(s) {
          names.push(s)
        }
      }
      names
    }
    _ => []
  }
  for name in required {
    if props.get(name) is None {
      ctx.add_error(
        ip,
        sp.key("required"),
        "required",
        "required property \{name} is missing",
      )
    }
  }
  let count = props.length()
  match obj.get("maxProperties") {
    Some(Number(m, ..)) =>
      if count > m.to_int() {
        ctx.add_error(
          ip,
          sp.key("maxProperties"),
          "maxProperties",
          "object has \{count} properties, more than maxProperties \{m.to_int()}",
        )
      }
    _ => ()
  }
  match obj.get("minProperties") {
    Some(Number(m, ..)) =>
      if count < m.to_int() {
        ctx.add_error(
          ip,
          sp.key("minProperties"),
          "minProperties",
          "object has \{count} properties, fewer than minProperties \{m.to_int()}",
        )
      }
    _ => ()
  }
  let ip_str = render_path(ip)
  for name, sub in prop_defs {
    match props.get(name) {
      Some(v) => {
        validate_node(ctx, sub, v, ip.key(name), sp.key("properties").key(name))
        ctx.note_prop(ip_str, name)
      }
      None => ()
    }
  }
  // which instance keys were directly checked by properties/patternProperties
  let covered : Map[String, Bool] = {}
  for key, _v in props {
    if prop_defs.get(key) is Some(_) {
      covered.set(key, true)
    } else {
      for pattern, _sub in pattern_defs {
        if key_matches_pattern(ctx, pattern, key) {
          covered.set(key, true)
          break
        }
      }
    }
  }
  for pattern, sub in pattern_defs {
    for key, v in props {
      if key_matches_pattern(ctx, pattern, key) {
        validate_node(
          ctx,
          sub,
          v,
          ip.key(key),
          sp.key("patternProperties").key(pattern),
        )
        ctx.note_prop(ip_str, key)
      }
    }
  }
  match obj.get("additionalProperties") {
    Some(False) =>
      for key, _v in props {
        if covered.get(key) is None {
          ctx.add_error(
            ip.key(key),
            sp.key("additionalProperties"),
            "additionalProperties",
            "property \{key} is not allowed by properties/patternProperties and additionalProperties is false",
          )
        }
      }
    Some(ap_schema) =>
      for key, v in props {
        if covered.get(key) is None {
          validate_node(
            ctx,
            ap_schema,
            v,
            ip.key(key),
            sp.key("additionalProperties"),
          )
          ctx.note_prop(ip_str, key)
        }
      }
    None => ()
  }
  match obj.get("propertyNames") {
    Some(pn_schema) =>
      for key, _v in props {
        validate_node(
          ctx,
          pn_schema,
          Json::string(key),
          ip.key(key),
          sp.key("propertyNames"),
        )
      }
    None => ()
  }
  match obj.get("dependentRequired") {
    Some(Object(deps)) =>
      for key, dep_list in deps {
        if props.get(key) is Some(_) {
          if dep_list is Array(list) {
            for dep in list {
              if dep is String(d) {
                if props.get(d) is None {
                  ctx.add_error(
                    ip,
                    sp.key("dependentRequired").key(key),
                    "dependentRequired",
                    "property \{d} is required when \{key} is present",
                  )
                }
              }
            }
          }
        }
      }
    _ => ()
  }
  match obj.get("dependentSchemas") {
    Some(Object(deps)) =>
      for key, dep_schema in deps {
        if props.get(key) is Some(_) {
          validate_node(
            ctx,
            dep_schema,
            inst,
            ip,
            sp.key("dependentSchemas").key(key),
          )
        }
      }
    _ => ()
  }
}
