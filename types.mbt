///|
/// A single validation failure.
///
/// Both locations are expressed as JSON Pointers (RFC 6901):
/// `instance_path` locates the offending value inside the validated document
/// (e.g. `/users/0/age`), `schema_path` locates the failing keyword inside the
/// schema document (e.g. `#/properties/users/items/properties/age/type`).
pub(all) struct ValidationError {
  instance_path : String
  schema_path : String
  keyword : String
  message : String
} derive(Debug, Eq)

///|
/// Error type of the string-level entry point `validate_json`.
pub(all) enum JsonSchemaError {
  SchemaParseError(String)
  InstanceParseError(String)
  ValidationErrors(Array[ValidationError])
} derive(Debug)

///|
/// Internal path used while recursing through the instance / schema.
/// Linked list so descending into a child is O(1); rendered only on error.
priv enum Path {
  PRoot
  PKey(String, Path)
  PIdx(Int, Path)
}

///|
fn Path::key(self : Path, k : String) -> Path {
  PKey(k, self)
}

///|
fn Path::idx(self : Path, i : Int) -> Path {
  PIdx(i, self)
}

///|
/// Escape a token per RFC 6901: `~` -> `~0`, `/` -> `~1`.
fn escape_pointer_token(s : String) -> String {
  let buf = StringBuilder()
  for c in s {
    match c {
      '~' => buf.write_string("~0")
      '/' => buf.write_string("~1")
      _ => buf.write_char(c)
    }
  }
  buf.to_string()
}

///|
fn render_path(p : Path) -> String {
  match p {
    PRoot => ""
    PKey(k, parent) => render_path(parent) + "/" + escape_pointer_token(k)
    PIdx(i, parent) => render_path(parent) + "/" + i.to_string()
  }
}

///|
/// Validation context threaded through the recursion.
priv struct Ctx {
  root : Json
  errors : Array[ValidationError]
  regex_cache : Map[String, @regexp.Regexp]
  mut depth : Int
  // Annotation tracking for unevaluatedProperties / unevaluatedItems,
  // keyed by rendered instance path. A stack of scopes: applicator
  // branches (allOf/anyOf/oneOf/if) push a scope so annotations do not
  // leak between cousin branches; a successful branch merges its scope
  // into the parent, a failed branch drops it.
  anno_stack : Array[Annos]
  // Resource scope stack for $dynamicRef / fragment resolution: the
  // root schema plus every schema resource ($id node or external
  // document) currently being applied, innermost last.
  resource_stack : Array[Json]
  // External documents available for $ref resolution, URI -> document.
  docs : Map[String, Json]
  // Registry of $id -> schema node (absolute ids), built once.
  ids : Map[String, Json]
  mut ids_built : Bool
  // How many resource scopes the last $ref resolution jumped into;
  // kw_ref pops them after validating the target.
  mut jumped : Int
  // Stack of absolute $id base URIs of the schemas being applied.
  id_stack : Array[String]
}

///|
/// Annotations collected at one scope level.
priv struct Annos {
  props : Map[String, Map[String, Bool]]
  items : Map[String, Map[Int, Bool]]
}

///|
fn Annos::empty() -> Annos {
  { props: {}, items: {}, }
}

///|
fn Ctx::current_annos(self : Ctx) -> Annos {
  self.anno_stack[self.anno_stack.length() - 1]
}

///|
fn Ctx::push_scope(self : Ctx) -> Unit {
  self.anno_stack.push(Annos::empty())
}

///|
/// Merge the top scope into its parent and pop it.
fn Ctx::merge_scope(self : Ctx) -> Unit {
  if self.anno_stack.length() < 2 {
    return
  }
  let top = self.anno_stack[self.anno_stack.length() - 1]
  let _ = self.anno_stack.pop()
  let parent = self.current_annos()
  for ip, set in top.props {
    for key, _v in set {
      note_prop_in(parent, ip, key)
    }
  }
  for ip, set in top.items {
    for idx, _v in set {
      note_item_in(parent, ip, idx)
    }
  }
}

///|
fn Ctx::drop_scope(self : Ctx) -> Unit {
  if self.anno_stack.length() > 1 {
    let _ = self.anno_stack.pop()
  }
}

///|
fn note_prop_in(annos : Annos, ip : String, key : String) -> Unit {
  match annos.props.get(ip) {
    Some(set) => set.set(key, true)
    None => {
      let set : Map[String, Bool] = {}
      set.set(key, true)
      annos.props.set(ip, set)
    }
  }
}

///|
fn note_item_in(annos : Annos, ip : String, idx : Int) -> Unit {
  match annos.items.get(ip) {
    Some(set) => set.set(idx, true)
    None => {
      let set : Map[Int, Bool] = {}
      set.set(idx, true)
      annos.items.set(ip, set)
    }
  }
}

///|
fn Ctx::note_prop(self : Ctx, ip : String, key : String) -> Unit {
  note_prop_in(self.current_annos(), ip, key)
}

///|
fn Ctx::note_item(self : Ctx, ip : String, idx : Int) -> Unit {
  note_item_in(self.current_annos(), ip, idx)
}

///|
fn Ctx::prop_evaluated(self : Ctx, ip : String, key : String) -> Bool {
  let annos = self.current_annos()
  annos.props.get(ip) is Some(set) && set.get(key) is Some(true)
}

///|
fn Ctx::item_evaluated(self : Ctx, ip : String, idx : Int) -> Bool {
  let annos = self.current_annos()
  annos.items.get(ip) is Some(set) && set.get(idx) is Some(true)
}

///|
const MAX_DEPTH : Int = 300

///|
fn Ctx::add_error(
  self : Ctx,
  ip : Path,
  sp : Path,
  kw : String,
  msg : String,
) -> Unit {
  self.errors.push({
    instance_path: render_path(ip),
    schema_path: "#" + render_path(sp),
    keyword: kw,
    message: msg,
  })
}

///|
/// Run a subschema in "probe" mode: returns whether it validates,
/// discarding any errors and annotations a failed branch would have
/// produced. Used by anyOf / oneOf / not / if / contains.
fn Ctx::probe(
  self : Ctx,
  schema : Json,
  inst : Json,
  ip : Path,
  sp : Path,
) -> Bool {
  let mark = self.errors.length()
  self.push_scope()
  validate_node(self, schema, inst, ip, sp)
  let ok = self.errors.length() == mark
  if self.errors.length() > mark {
    self.errors.truncate(mark)
  }
  if ok {
    self.merge_scope()
  } else {
    self.drop_scope()
  }
  ok
}

///|
/// Compile (and cache) a regex, or None if the pattern is invalid.
fn Ctx::regex(self : Ctx, pattern : String) -> @regexp.Regexp? {
  match self.regex_cache.get(pattern) {
    Some(re) => Some(re)
    None => {
      let compiled : @regexp.Regexp? = Some(@regexp.compile(pattern)) catch {
        _ => None
      }
      match compiled {
        Some(re) => {
          self.regex_cache.set(pattern, re)
          Some(re)
        }
        None => None
      }
    }
  }
}
