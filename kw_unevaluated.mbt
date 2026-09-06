///|
/// unevaluatedProperties / unevaluatedItems (2020-12).
///
/// These apply only to properties/items that no other applicator
/// (properties, patternProperties, additionalProperties, prefixItems,
/// items, contains, or successful branches of allOf/anyOf/oneOf/if)
/// has already evaluated at the same instance location. The evaluation
/// records are collected in Ctx as annotations; this keyword must run
/// last, after all sibling applicators.
fn kw_unevaluated(
  ctx : Ctx,
  obj : Map[String, Json],
  inst : Json,
  ip : Path,
  sp : Path,
) -> Unit {
  match obj.get("unevaluatedProperties") {
    Some(up_schema) =>
      if inst is Object(props) {
        let ip_str = render_path(ip)
        for key, v in props {
          if !ctx.prop_evaluated(ip_str, key) {
            validate_node(
              ctx,
              up_schema,
              v,
              ip.key(key),
              sp.key("unevaluatedProperties"),
            )
            ctx.note_prop(ip_str, key)
          }
        }
      }
    None => ()
  }
  match obj.get("unevaluatedItems") {
    Some(ui_schema) =>
      if inst is Array(items) {
        let ip_str = render_path(ip)
        for i, item in items {
          if !ctx.item_evaluated(ip_str, i) {
            validate_node(
              ctx,
              ui_schema,
              item,
              ip.idx(i),
              sp.key("unevaluatedItems"),
            )
            ctx.note_item(ip_str, i)
          }
        }
      }
    None => ()
  }
}
