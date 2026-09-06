///|
/// `$ref` / `$dynamicRef` resolution and application.
///
/// Scope: references within the same document — JSON Pointer fragments
/// (`#/...`) and plain-name fragments (`#anchor`). External URLs and
/// `$id`-relative bases are reported as unresolvable.
fn kw_ref(
  ctx : Ctx,
  obj : Map[String, Json],
  inst : Json,
  ip : Path,
  sp : Path,
) -> Unit {
  match obj.get("$ref") {
    Some(String(reference)) =>
      match resolve_reference(ctx, reference) {
        Some(target) => validate_node(ctx, target, inst, ip, sp.key("$ref"))
        None =>
          ctx.add_error(
            ip,
            sp.key("$ref"),
            "$ref",
            "cannot resolve reference \{reference} (only same-document references are supported)",
          )
      }
    _ => ()
  }
  // Simplified $dynamicRef: behaves like a static reference to the named
  // anchor. Full dynamic-scope semantics (runtime resolution against the
  // outermost $dynamicAnchor in scope) is not implemented yet.
  match obj.get("$dynamicRef") {
    Some(String(reference)) => {
      // reference is like "#node" or a URI ending in "#node"
      let anchor = fragment_name(reference)
      match anchor {
        Some(name) =>
          match ctx.lookup_anchor(name) {
            Some(target) =>
              validate_node(ctx, target, inst, ip, sp.key("$dynamicRef"))
            None =>
              ctx.add_error(
                ip,
                sp.key("$dynamicRef"),
                "$dynamicRef",
                "cannot resolve dynamic anchor \{name}",
              )
          }
        None =>
          ctx.add_error(
            ip,
            sp.key("$dynamicRef"),
            "$dynamicRef",
            "cannot resolve dynamic reference \{reference}",
          )
      }
    }
    _ => ()
  }
}

///|
/// Extract the plain-name fragment of a URI reference ("#foo" -> "foo").
fn fragment_name(reference : String) -> String? {
  match reference.rev_split_once("#") {
    Some((_before, after)) =>
      if after.length() == 0 {
        None
      } else {
        Some(after.to_string())
      }
    None => None
  }
}

///|
/// Resolve a same-document reference to a schema node.
fn resolve_reference(ctx : Ctx, reference : String) -> Json? {
  if reference == "#" {
    return Some(ctx.root)
  }
  if reference.has_prefix("#/") {
    match parse_pointer_fragment(reference) {
      Some(tokens) => resolve_pointer_tokens(ctx.root, tokens)
      None => None
    }
  } else if reference.has_prefix("#") {
    match fragment_name(reference) {
      Some(name) => ctx.lookup_anchor(name)
      None => None
    }
  } else {
    None
  }
}

///|
fn Ctx::lookup_anchor(self : Ctx, name : String) -> Json? {
  self.ensure_anchors()
  self.anchors.get(name)
}
