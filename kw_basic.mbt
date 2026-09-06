///|
/// Name of a JSON value's type as used by the `type` keyword.
fn json_type_name(v : Json) -> String {
  match v {
    Null => "null"
    True | False => "boolean"
    Number(_, ..) => "number"
    String(_) => "string"
    Array(_) => "array"
    Object(_) => "object"
  }
}

///|
/// `type: integer` accepts numbers with zero fractional part (1, 1.0, -2).
fn is_double_integer(n : Double) -> Bool {
  n.floor() == n
}

///|
fn type_allows(t : String, v : Json) -> Bool {
  match (t, v) {
    ("null", Null) => true
    ("boolean", True | False) => true
    ("number", Number(_, ..)) => true
    ("integer", Number(n, ..)) => is_double_integer(n)
    ("string", String(_)) => true
    ("array", Array(_)) => true
    ("object", Object(_)) => true
    _ => false
  }
}

///|
/// `type`, `enum`, `const`.
fn kw_type_enum_const(
  ctx : Ctx,
  obj : Map[String, Json],
  inst : Json,
  ip : Path,
  sp : Path,
) -> Unit {
  match obj.get("type") {
    Some(String(t)) =>
      if !type_allows(t, inst) {
        ctx.add_error(
          ip,
          sp.key("type"),
          "type",
          "expected \{t}, got \{json_type_name(inst)}",
        )
      }
    Some(Array(alts)) => {
      let mut ok = false
      for alt in alts {
        if alt is String(t) {
          if type_allows(t, inst) {
            ok = true
            break
          }
        }
      }
      if !ok {
        ctx.add_error(
          ip,
          sp.key("type"),
          "type",
          "value of type \{json_type_name(inst)} is not in the allowed type list",
        )
      }
    }
    _ => ()
  }
  match obj.get("enum") {
    Some(Array(items)) => {
      let mut found = false
      for item in items {
        if item == inst {
          found = true
          break
        }
      }
      if !found {
        ctx.add_error(
          ip,
          sp.key("enum"),
          "enum",
          "value is not one of the allowed enum values",
        )
      }
    }
    _ => ()
  }
  match obj.get("const") {
    Some(c) =>
      if c != inst {
        ctx.add_error(
          ip,
          sp.key("const"),
          "const",
          "value does not equal the const value",
        )
      }
    None => ()
  }
}

///|
/// Numeric keywords: multipleOf, maximum, exclusiveMaximum, minimum,
/// exclusiveMinimum.
fn kw_numeric(
  ctx : Ctx,
  obj : Map[String, Json],
  inst : Json,
  ip : Path,
  sp : Path,
) -> Unit {
  guard inst is Number(n, ..) else { return }
  match obj.get("maximum") {
    Some(Number(m, ..)) =>
      if n > m {
        ctx.add_error(
          ip,
          sp.key("maximum"),
          "maximum",
          "\{n} is greater than maximum \{m}",
        )
      }
    _ => ()
  }
  match obj.get("exclusiveMaximum") {
    Some(Number(m, ..)) =>
      if n >= m {
        ctx.add_error(
          ip,
          sp.key("exclusiveMaximum"),
          "exclusiveMaximum",
          "\{n} is not less than exclusiveMaximum \{m}",
        )
      }
    _ => ()
  }
  match obj.get("minimum") {
    Some(Number(m, ..)) =>
      if n < m {
        ctx.add_error(
          ip,
          sp.key("minimum"),
          "minimum",
          "\{n} is less than minimum \{m}",
        )
      }
    _ => ()
  }
  match obj.get("exclusiveMinimum") {
    Some(Number(m, ..)) =>
      if n <= m {
        ctx.add_error(
          ip,
          sp.key("exclusiveMinimum"),
          "exclusiveMinimum",
          "\{n} is not greater than exclusiveMinimum \{m}",
        )
      }
    _ => ()
  }
  match obj.get("multipleOf") {
    Some(Number(m, ..)) =>
      if m != 0.0 && !is_multiple(n, m) {
        ctx.add_error(
          ip,
          sp.key("multipleOf"),
          "multipleOf",
          "\{n} is not a multiple of \{m}",
        )
      }
    _ => ()
  }
}

///|
/// Tolerant divisibility check for floating-point numbers:
/// a quotient within 1e-9 of an integer counts as divisible.
/// (JSON Schema defines multiples mathematically; doubles carry
/// representation error, e.g. 0.0075 / 0.0001 = 74.99999999999986.)
fn is_multiple(n : Double, m : Double) -> Bool {
  let q = n / m
  (q - q.floor()).abs() < 0.000000001
}

///|
/// Number of Unicode code points (minLength / maxLength are defined
/// over code points, not UTF-16 units).
fn code_point_length(s : String) -> Int {
  let mut n = 0
  for _ in s {
    n = n + 1
  }
  n
}

///|
/// String keywords: maxLength, minLength, pattern.
fn kw_string(
  ctx : Ctx,
  obj : Map[String, Json],
  inst : Json,
  ip : Path,
  sp : Path,
) -> Unit {
  guard inst is String(s) else { return }
  let len = code_point_length(s)
  match obj.get("maxLength") {
    Some(Number(m, ..)) =>
      if len > m.to_int() {
        ctx.add_error(
          ip,
          sp.key("maxLength"),
          "maxLength",
          "string length \{len} exceeds maxLength \{m.to_int()}",
        )
      }
    _ => ()
  }
  match obj.get("minLength") {
    Some(Number(m, ..)) =>
      if len < m.to_int() {
        ctx.add_error(
          ip,
          sp.key("minLength"),
          "minLength",
          "string length \{len} is below minLength \{m.to_int()}",
        )
      }
    _ => ()
  }
  match obj.get("pattern") {
    Some(String(p)) =>
      match ctx.regex(p) {
        Some(re) =>
          if re.match_(s) is None {
            ctx.add_error(
              ip,
              sp.key("pattern"),
              "pattern",
              "string does not match pattern \{p}",
            )
          }
        None =>
          ctx.add_error(
            ip,
            sp.key("pattern"),
            "pattern",
            "invalid regular expression \{p}",
          )
      }
    _ => ()
  }
}
