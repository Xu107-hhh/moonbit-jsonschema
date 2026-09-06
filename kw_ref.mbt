///|
/// `$ref` / `$dynamicRef` resolution and application.
///
/// Supported: JSON Pointer fragments (`#/...`, percent-encoded per
/// RFC 3986), plain-name fragments (`#anchor`), and same-document URI
/// references resolved against the `$id` stack (embedded `$id` resources
/// are registered while walking the document). External URLs remain
/// unresolvable - no network fetch is performed by design.
fn kw_ref(
  ctx : Ctx,
  obj : Map[String, Json],
  inst : Json,
  ip : Path,
  sp : Path,
) -> Unit {
  // resolving may enter other resources; the scope stack must be
  // balanced again when this keyword is done, so remember the depth
  let stack_mark = ctx.resource_stack.length()
  match obj.get("$ref") {
    Some(String(reference)) =>
      match resolve_reference(ctx, reference) {
        Some(target) => {
          validate_node(ctx, target, inst, ip, sp.key("$ref"))
          ctx.pop_to(stack_mark)
        }
        None => {
          ctx.pop_to(stack_mark)
          ctx.add_error(
            ip,
            sp.key("$ref"),
            "$ref",
            "cannot resolve reference \{reference}",
          )
        }
      }
    _ => ()
  }
  match obj.get("$dynamicRef") {
    Some(String(reference)) => {
      let stack_mark2 = ctx.resource_stack.length()
      match resolve_dynamic_reference(ctx, reference) {
        Some(target) => {
          validate_node(ctx, target, inst, ip, sp.key("$dynamicRef"))
          ctx.pop_to(stack_mark2)
        }
        None => {
          ctx.pop_to(stack_mark2)
          ctx.add_error(
            ip,
            sp.key("$dynamicRef"),
            "$dynamicRef",
            "cannot resolve dynamic reference \{reference}",
          )
        }
      }
    }
    _ => ()
  }
}

///|
/// Find an anchor by name within one schema resource (the resource
/// node itself plus its subtree, stopping at nested `$id` boundaries).
/// `dynamic_only` restricts the search to `$dynamicAnchor`.
fn find_anchor_in_resource(
  node : Json,
  name : String,
  dynamic_only : Bool,
) -> Json? {
  match node {
    Object(o) => {
      for k, v in o {
        if k == "$id" {
          continue
        }
        if (k == "$dynamicAnchor" || (k == "$anchor" && !dynamic_only)) &&
          v is String(n) &&
          n == name {
          return Some(node)
        }
      }
      for _k, v in o {
        // do not descend into nested schema resources
        if v is Object(vo) && vo.get("$id") is Some(_) {
          continue
        }
        let found = find_anchor_in_resource(v, name, dynamic_only)
        if found is Some(_) {
          return found
        }
      }
      None
    }
    Array(a) => {
      for e in a {
        // array elements can also be schema resources
        if e is Object(eo) && eo.get("$id") is Some(_) {
          continue
        }
        let found = find_anchor_in_resource(e, name, dynamic_only)
        if found is Some(_) {
          return found
        }
      }
      None
    }
    _ => None
  }
}

///|
/// Resolve a `$dynamicRef` per 2020-12 section 8.2.3.2:
/// 1. pointer fragments behave exactly like `$ref`;
/// 2. plain-name fragments resolve initially against the current
///    resource's anchors;
/// 3. if that initial target carries a matching `$dynamicAnchor`
///    (the "bookend"), the final target is the outermost resource on
///    the resource scope stack that contains such an anchor;
/// 4. otherwise the initial target stands (plain `$ref` behavior).
fn resolve_dynamic_reference(ctx : Ctx, reference : String) -> Json? {
  let fragment = fragment_name(reference)
  guard fragment is Some(name) else { return None }
  if name.has_prefix("/") {
    return resolve_reference(ctx, reference)
  }
  // initial resolution
  let initial : Json? = if reference.has_prefix("#") {
    // search the resource scope stack innermost-outward
    let mut found : Json? = None
    for i in 0..<ctx.resource_stack.length() {
      let res = ctx.resource_stack[ctx.resource_stack.length() - 1 - i]
      let hit = find_anchor_in_resource(res, name, false)
      if hit is Some(_) {
        found = hit
        break
      }
    }
    found
  } else {
    // uri#name: resolve the resource, then search within it
    let uri_part = match reference.rev_split_once("#") {
      Some((before, _)) => before.to_string()
      None => reference
    }
    match resolve_uri_reference(ctx, uri_part) {
      Some(doc) => find_anchor_in_resource(doc, name, false)
      None => None
    }
  }
  guard initial is Some(target) else { return None }
  // bookend check on the initial target
  let has_bookend = target is Object(o) &&
    o.get("$dynamicAnchor") is Some(String(n)) &&
    n == name
  if has_bookend {
    // outermost resource containing a $dynamicAnchor with this name wins
    for i in 0..<ctx.resource_stack.length() {
      let hit = find_anchor_in_resource(ctx.resource_stack[i], name, true)
      if hit is Some(_) {
        return hit
      }
    }
  }
  Some(target)
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
    // pointer fragments resolve against the current resource (base URI),
    // which is the innermost resource on the scope stack - not necessarily
    // the root document
    let res = ctx.resource_stack[ctx.resource_stack.length() - 1]
    match parse_pointer_fragment(reference) {
      Some(tokens) => resolve_pointer_tokens(res, tokens)
      None => None
    }
  } else if reference.has_prefix("#") {
    match fragment_name(reference) {
      Some(name) => {
        // plain-name fragment: resolve within the current resource,
        // searching the resource scope stack innermost-outward
        let mut found : Json? = None
        for i in 0..<ctx.resource_stack.length() {
          let res = ctx.resource_stack[ctx.resource_stack.length() - 1 - i]
          let hit = find_anchor_in_resource(res, name, false)
          if hit is Some(_) {
            found = hit
            break
          }
        }
        found
      }
      None => None
    }
  } else {
    resolve_uri_reference(ctx, reference)
  }
}

///|
/// Resolve a URI reference against the current $id base and the
/// document's $id registry: whole-resource refs ("...name.json") and
/// fragment refs ("...name.json#/pointer" or "...#anchor").
fn resolve_uri_reference(ctx : Ctx, reference : String) -> Json? {
  ctx.ensure_ids()
  ctx.jumped = 0
  let base = ctx.id_stack[ctx.id_stack.length() - 1]
  let abs = uri_join(base, reference)
  // the official 2020-12 metaschema is built in (see metaschema.mbt),
  // so schema documents can be validated like any other instance
  if abs == "https://json-schema.org/draft/2020-12/schema" ||
    abs == "https://json-schema.org/draft/2020-12/schema#" ||
    abs == "http://json-schema.org/draft/2020-12/schema" {
    return Some(lookup_builtin_metaschema(ctx, abs))
  }
  // whole-resource reference, including external documents supplied
  // via validate_with_docs
  match lookup_doc(ctx, abs) {
    Some(node) => {
      ctx.jump_to(node, abs)
      return Some(node)
    }
    None => ()
  }
  // resource#fragment reference
  match reference.rev_split_once("#") {
    Some((uri_part, frag)) => {
      let abs_base = uri_join(base, uri_part.to_string())
      match lookup_doc(ctx, abs_base) {
        Some(node) => {
          ctx.jump_to(node, abs_base)
          let frag_str = frag.to_string()
          if frag_str.has_prefix("/") {
            match parse_pointer_fragment(frag_str) {
              Some(tokens) => resolve_pointer_tokens(node, tokens)
              None => None
            }
          } else {
            // anchor within that resource
            find_anchor_in_resource(node, frag_str, false)
          }
        }
        None => None
      }
    }
    None => None
  }
}

///|
/// Enter a resolved resource scope; kw_ref pops it (ctx.jumped times)
/// after the target has been validated.
fn Ctx::jump_to(self : Ctx, node : Json, uri : String) -> Unit {
  self.id_stack.push(uri)
  self.resource_stack.push(node)
  self.jumped = self.jumped + 1
}

///|
/// Pop resource scopes down to the given depth (balancing what a
/// $ref / $dynamicRef resolution entered).
fn Ctx::pop_to(self : Ctx, mark : Int) -> Unit {
  while self.resource_stack.length() > mark {
    let _ = self.id_stack.pop()
    let _ = self.resource_stack.pop()
  }
  self.jumped = 0
}

///|
/// Look up a schema resource by absolute URI: the embedded-$id registry
/// first, then the external documents registered by validate_with_docs
/// (registering the document's own nested $ids on first touch).
fn lookup_doc(ctx : Ctx, abs : String) -> Json? {
  match ctx.ids.get(abs) {
    Some(node) => Some(node)
    None =>
      match ctx.docs.get(abs) {
        Some(doc) => {
          ctx.ids.set(abs, doc)
          let _ = collect_ids(doc, abs, ctx.ids)
          Some(doc)
        }
        None => None
      }
  }
}

///|
/// Register this node's $id (absolutized against the current base) and
/// push the new base URI and resource scope. Returns true if pushed.
fn Ctx::push_id(self : Ctx, schema : Json) -> Bool {
  guard schema is Object(obj) else { return false }
  match obj.get("$id") {
    Some(String(id)) => {
      // if this exact resource is already the innermost scope, the
      // $ref resolution that jumped into it has already pushed its
      // base URI - do not stack it a second time
      if self.resource_stack[self.resource_stack.length() - 1] == schema {
        return false
      }
      self.ensure_ids()
      let base = self.id_stack[self.id_stack.length() - 1]
      self.id_stack.push(uri_join(base, id))
      self.resource_stack.push(schema)
      true
    }
    _ => false
  }
}

///|
/// Build the absolute-$id registry of the root document (once).
fn Ctx::ensure_ids(self : Ctx) -> Unit {
  if self.ids_built {
    return
  }
  self.ids_built = true
  let _ = collect_ids(self.root, "", self.ids)
}

///|
/// Walk the document registering every $id (absolutized against the
/// nearest ancestor $id) and return the base URI for children.
fn collect_ids(node : Json, base : String, ids : Map[String, Json]) -> String {
  guard node is Object(o) else { return base }
  let child_base = match o.get("$id") {
    Some(String(id)) => {
      let abs = uri_join(base, id)
      if ids.get(abs) is None {
        ids.set(abs, node)
      }
      abs
    }
    _ => base
  }
  for _k, v in o {
    let _ = collect_ids(v, child_base, ids)
  }
  child_base
}

///|
fn has_scheme(s : String) -> Bool {
  let mut i = 0
  for c in s {
    if c == ':' {
      return i > 0
    }
    if c == '/' {
      return false
    }
    let ok = (c >= 'a' && c <= 'z') ||
      (c >= 'A' && c <= 'Z') ||
      (c >= '0' && c <= '9') ||
      c == '+' ||
      c == '-' ||
      c == '.'
    if !ok {
      return false
    }
    i = i + 1
  }
  false
}

///|
/// First `n` characters of `s` (URI strings; ASCII in practice).
fn str_upto(s : String, n : Int) -> String {
  let buf = StringBuilder()
  let mut i = 0
  for c in s {
    if i >= n {
      break
    }
    buf.write_char(c)
    i = i + 1
  }
  buf.to_string()
}

///|
/// Everything from the `from`-th character onward.
fn str_from(s : String, from : Int) -> String {
  let buf = StringBuilder()
  let mut i = 0
  for c in s {
    if i >= from {
      buf.write_char(c)
    }
    i = i + 1
  }
  buf.to_string()
}

///|
/// Minimal RFC 3986 reference resolution (no query/fragment handling):
/// absolute refs pass through, network-path and absolute-path refs are
/// prefixed with the base scheme/authority, relative refs are merged
/// with the base directory and normalized.
fn uri_join(base : String, reference : String) -> String {
  if reference.length() == 0 {
    return base
  }
  if has_scheme(reference) {
    return reference
  }
  // split base into scheme+authority prefix and path
  let mut prefix = ""
  let mut base_path = ""
  match base.find("://") {
    Some(p) => {
      let after_scheme = str_from(base, p + 3)
      match after_scheme.find("/") {
        Some(q) => {
          prefix = str_upto(base, p + 3 + q)
          base_path = str_from(base, p + 3 + q)
        }
        None => {
          prefix = base + "/"
          base_path = "/"
        }
      }
    }
    None => base_path = base
  }
  if reference.has_prefix("//") {
    // keep only scheme:// from the prefix
    let scheme_only = match prefix.find("://") {
      Some(p) => str_upto(prefix, p + 3)
      None => prefix
    }
    return scheme_only + reference
  }
  if reference.has_prefix("/") {
    return prefix + reference
  }
  // relative: merge with base directory, then normalize . / .. segments
  let dir = match base_path.rev_find("/") {
    Some(i) => str_upto(base_path, i + 1)
    None => ""
  }
  prefix + normalize_path(dir + reference)
}

///|
/// Collapse "." and ".." path segments of an absolute path.
fn normalize_path(path : String) -> String {
  if !path.has_prefix("/") {
    return path // leave relative junk alone
  }
  let segs : Array[String] = []
  let buf = StringBuilder()
  for c in path {
    if c == '/' {
      segs.push(buf.to_string())
      buf.reset()
    } else {
      buf.write_char(c)
    }
  }
  segs.push(buf.to_string())
  let out : Array[String] = []
  for seg in segs {
    if seg == "." {
      continue
    } else if seg == ".." {
      if out.length() > 0 && out[out.length() - 1] != "" {
        let _ = out.pop()
      }
    } else {
      out.push(seg)
    }
  }
  let joined = StringBuilder()
  for i, seg in out {
    if i > 0 {
      joined.write_char('/')
    }
    joined.write_string(seg)
  }
  joined.to_string()
}

///|
fn hex_val(c : Char) -> Int? {
  if c >= '0' && c <= '9' {
    Some(c.to_int() - '0'.to_int())
  } else if c >= 'a' && c <= 'f' {
    Some(c.to_int() - 'a'.to_int() + 10)
  } else if c >= 'A' && c <= 'F' {
    Some(c.to_int() - 'A'.to_int() + 10)
  } else {
    None
  }
}

///|
/// Percent-decode a URI component ("%25" -> "%"). Invalid escapes pass
/// through unchanged.
fn decode_percent(s : String) -> String {
  let chars : Array[Char] = []
  for c in s {
    chars.push(c)
  }
  let buf = StringBuilder()
  let n = chars.length()
  let mut i = 0
  while i < n {
    let c = chars[i]
    if c == '%' && i + 2 < n {
      let h = hex_val(chars[i + 1])
      let l = hex_val(chars[i + 2])
      if h is Some(hv) && l is Some(lv) {
        let code = hv * 16 + lv
        match code.to_char() {
          Some(ch) => buf.write_char(ch)
          None => buf.write_string("%")
        }
        i = i + 3
        continue
      }
    }
    buf.write_char(c)
    i = i + 1
  }
  buf.to_string()
}
