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
  anchors : Map[String, Json]
  mut anchors_built : Bool
  mut depth : Int
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
/// discarding any errors it would have produced. Used by anyOf / oneOf /
/// not / if / contains, whose branch failures are not themselves reported.
fn Ctx::probe(
  self : Ctx,
  schema : Json,
  inst : Json,
  ip : Path,
  sp : Path,
) -> Bool {
  let mark = self.errors.length()
  validate_node(self, schema, inst, ip, sp)
  let ok = self.errors.length() == mark
  if self.errors.length() > mark {
    self.errors.truncate(mark)
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

///|
/// Build the $anchor / $dynamicAnchor index of the root document (once).
fn Ctx::ensure_anchors(self : Ctx) -> Unit {
  if self.anchors_built {
    return
  }
  self.anchors_built = true
  collect_anchors(self.root, self.anchors)
}

///|
fn collect_anchors(node : Json, into : Map[String, Json]) -> Unit {
  guard node is Object(o) else { return }
  for k, v in o {
    if (k == "$anchor" || k == "$dynamicAnchor") && v is String(name) {
      if into.get(name) is None {
        into.set(name, node)
      }
    }
    collect_anchors(v, into)
  }
}
