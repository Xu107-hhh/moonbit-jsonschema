///|
/// Parse the fragment part of a JSON Pointer reference (RFC 6901),
/// e.g. `#/properties/foo` -> `["properties", "foo"]`.
/// Returns None if the fragment is malformed (empty token after `/`,
/// or an invalid escape such as `~2`).
fn parse_pointer_fragment(fragment : String) -> Array[String]? {
  let tokens : Array[String] = []
  let buf = StringBuilder()
  let mut in_escape = false
  let mut pos = 0
  for c in decode_percent(fragment) {
    if pos == 0 && c == '#' {
      pos = pos + 1
      continue // skip the leading '#'
    }
    if pos <= 1 && c != '#' {
      // first significant character must be '/'
      if c != '/' {
        return None // plain name: anchor reference, not a pointer
      }
      pos = 2
      continue
    }
    pos = pos + 1
    if in_escape {
      match c {
        '0' => buf.write_char('~')
        '1' => buf.write_char('/')
        _ => return None // invalid escape
      }
      in_escape = false
    } else if c == '~' {
      in_escape = true
    } else if c == '/' {
      tokens.push(buf.to_string())
      buf.reset()
    } else {
      buf.write_char(c)
    }
  }
  if pos < 2 {
    return None // empty fragment or "#" alone
  }
  if in_escape {
    return None // dangling '~'
  }
  tokens.push(buf.to_string())
  Some(tokens)
}

///|
/// Walk a JSON document along pointer tokens. Array tokens must be
/// canonical decimal indices (no leading zeros, per RFC 6901).
fn resolve_pointer_tokens(doc : Json, tokens : Array[String]) -> Json? {
  let mut cur = doc
  for t in tokens {
    match cur {
      Object(o) =>
        match o.get(t) {
          Some(v) => cur = v
          None => return None
        }
      Array(a) => {
        guard parse_index(t) is Some(i) else { return None }
        guard i < a.length() else { return None }
        cur = a[i]
      }
      _ => return None
    }
  }
  Some(cur)
}

///|
/// Parse a canonical array index (no leading zeros unless "0" itself).
fn parse_index(t : String) -> Int? {
  if t.length() == 0 {
    return None
  }
  let mut n = 0
  for c in t {
    guard c >= '0' && c <= '9' else { return None }
    n = n * 10 + (c.to_int() - '0'.to_int())
  }
  if t.length() > 1 && t.get_char(0) == Some('0') {
    return None
  }
  Some(n)
}
