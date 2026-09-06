///|
/// Combinator and conditional keywords:
/// allOf, anyOf, oneOf, not, if/then/else.
fn kw_logic(
  ctx : Ctx,
  obj : Map[String, Json],
  inst : Json,
  ip : Path,
  sp : Path,
) -> Unit {
  match obj.get("allOf") {
    Some(Array(schemas)) =>
      for i, sub in schemas {
        // each branch runs in its own annotation scope so that cousin
        // branches cannot see each other's evaluations; a branch's
        // annotations merge into the parent once it has run
        ctx.push_scope()
        validate_node(ctx, sub, inst, ip, sp.key("allOf").idx(i))
        ctx.merge_scope()
      }
    _ => ()
  }
  match obj.get("anyOf") {
    Some(Array(schemas)) => {
      let mut matched = false
      for i, sub in schemas {
        // evaluate every branch: annotations from all successful
        // branches must be visible to unevaluated* keywords
        if ctx.probe(sub, inst, ip, sp.key("anyOf").idx(i)) {
          matched = true
        }
      }
      if !matched {
        ctx.add_error(
          ip,
          sp.key("anyOf"),
          "anyOf",
          "value does not match any schema in anyOf",
        )
      }
    }
    _ => ()
  }
  match obj.get("oneOf") {
    Some(Array(schemas)) => {
      let mut matched = -1
      for i, sub in schemas {
        if ctx.probe(sub, inst, ip, sp.key("oneOf").idx(i)) {
          if matched >= 0 {
            matched = -2 // more than one
            break
          }
          matched = i
        }
      }
      if matched == -1 {
        ctx.add_error(
          ip,
          sp.key("oneOf"),
          "oneOf",
          "value does not match exactly one schema in oneOf (matched none)",
        )
      } else if matched == -2 {
        ctx.add_error(
          ip,
          sp.key("oneOf"),
          "oneOf",
          "value matches more than one schema in oneOf",
        )
      }
    }
    _ => ()
  }
  match obj.get("not") {
    Some(sub) =>
      if ctx.probe(sub, inst, ip, sp.key("not")) {
        ctx.add_error(
          ip,
          sp.key("not"),
          "not",
          "value matches the schema in `not` but must not",
        )
      }
    None => ()
  }
  match obj.get("if") {
    Some(if_schema) => {
      let ok = ctx.probe(if_schema, inst, ip, sp.key("if"))
      if ok {
        match obj.get("then") {
          Some(then_schema) =>
            validate_node(ctx, then_schema, inst, ip, sp.key("then"))
          None => ()
        }
      } else {
        match obj.get("else") {
          Some(else_schema) =>
            validate_node(ctx, else_schema, inst, ip, sp.key("else"))
          None => ()
        }
      }
    }
    None => ()
  }
}
