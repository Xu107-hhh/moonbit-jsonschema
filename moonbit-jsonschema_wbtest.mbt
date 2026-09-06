// Whitebox tests run within the package scope.
// Use them to validate internal helpers or invariants.
// Keep them focused; public behavior belongs in `_test.mbt`.

///|
test "parse_pointer_fragment: basic tokens" {
  let tokens = parse_pointer_fragment("#/properties/foo").unwrap()
  inspect(tokens, content="[properties, foo]")
}

///|
test "parse_pointer_fragment: no leading hash" {
  let tokens = parse_pointer_fragment("/a/b").unwrap()
  inspect(tokens, content="[a, b]")
}

///|
test "parse_pointer_fragment: escapes" {
  let tokens = parse_pointer_fragment("#/a~1b/c~0d").unwrap()
  inspect(tokens, content="[a/b, c~d]")
}

///|
test "parse_pointer_fragment: empty tokens are preserved" {
  // "/a//b" has an empty token between the slashes (RFC 6901 allows "")
  let tokens = parse_pointer_fragment("#/a//b").unwrap()
  inspect(tokens, content="[a, , b]")
}

///|
test "parse_pointer_fragment: rejects plain anchor names" {
  inspect(parse_pointer_fragment("#myAnchor") is None, content="true")
}

///|
test "parse_pointer_fragment: rejects empty and lone hash" {
  inspect(parse_pointer_fragment("") is None, content="true")
  inspect(parse_pointer_fragment("#") is None, content="true")
}

///|
test "parse_pointer_fragment: rejects invalid escapes" {
  inspect(parse_pointer_fragment("#/a~2b") is None, content="true")
  inspect(parse_pointer_fragment("#/a~") is None, content="true")
}

///|
test "resolve_pointer_tokens: walks objects and arrays" {
  let doc = @json.parse("{\"a\": [10, {\"b\": 3}]}")
  let tokens = parse_pointer_fragment("#/a/1/b").unwrap()
  inspect(resolve_pointer_tokens(doc, tokens), content="Some(Number(3))")
}

///|
test "resolve_pointer_tokens: canonical indices only" {
  let doc = @json.parse("{\"a\": [10, 20]}")
  let t1 = parse_pointer_fragment("#/a/01").unwrap()
  inspect(resolve_pointer_tokens(doc, t1) is None, content="true")
  let t2 = parse_pointer_fragment("#/a/5").unwrap()
  inspect(resolve_pointer_tokens(doc, t2) is None, content="true")
}

///|
test "escape_pointer_token: rfc 6901 escaping" {
  inspect(escape_pointer_token("a/b"), content="a~1b")
  inspect(escape_pointer_token("a~b"), content="a~0b")
}

///|
test "code_point_length: counts code points not utf16 units" {
  inspect(code_point_length("héllo"), content="5")
  inspect(code_point_length("你好"), content="2")
  inspect(code_point_length(""), content="0")
}

///|
test "is_multiple: float tolerance" {
  inspect(is_multiple(10.0, 5.0), content="true")
  inspect(is_multiple(10.0, 3.0), content="false")
  // classic floating point trap: 0.0075 / 0.0001 = 74.99999999999986
  inspect(is_multiple(0.0075, 0.0001), content="true")
}

///|
test "find_anchor_in_resource: finds nested anchors" {
  let text =
    #|{
    #|  "properties": {
    #|    "node": { "$anchor": "nodeAnchor", "type": "object" }
    #|  }
    #|}
  let doc = @json.parse(text)
  let hit = find_anchor_in_resource(doc, "nodeAnchor", false)
  inspect(
    hit is Some(Object(o)) && o.get("type") is Some(String("object")),
    content="true",
  )
}
