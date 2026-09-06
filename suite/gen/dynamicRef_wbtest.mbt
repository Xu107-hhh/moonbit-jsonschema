// Generated from JSON-Schema-Test-Suite tests/draft2020-12/dynamicRef.json
// (vendored copy in suite/fixtures/dynamicRef.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "dynamicRef [g0] A $dynamicRef to a $dynamicAnchor in the same schema resource behaves like a normal $ref t - An array of strings is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamicRef-dynamicAnchor-same-schema/root\", \"type\": \"array\", \"items\": {\"$dynamicRef\": \"#items\"}, \"$defs\": {\"foo\": {\"$dynamicAnchor\": \"items\", \"type\": \"string\"}}}",
  )
  let data = @json.parse("[\"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g0] A $dynamicRef to a $dynamicAnchor in the same schema resource behaves like a normal $ref t - An array containing non-strings is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamicRef-dynamicAnchor-same-schema/root\", \"type\": \"array\", \"items\": {\"$dynamicRef\": \"#items\"}, \"$defs\": {\"foo\": {\"$dynamicAnchor\": \"items\", \"type\": \"string\"}}}",
  )
  let data = @json.parse("[\"foo\", 42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g1] A $dynamicRef to an $anchor in the same schema resource behaves like a normal $ref to an $ - An array of strings is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamicRef-anchor-same-schema/root\", \"type\": \"array\", \"items\": {\"$dynamicRef\": \"#items\"}, \"$defs\": {\"foo\": {\"$anchor\": \"items\", \"type\": \"string\"}}}",
  )
  let data = @json.parse("[\"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g1] A $dynamicRef to an $anchor in the same schema resource behaves like a normal $ref to an $ - An array containing non-strings is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamicRef-anchor-same-schema/root\", \"type\": \"array\", \"items\": {\"$dynamicRef\": \"#items\"}, \"$defs\": {\"foo\": {\"$anchor\": \"items\", \"type\": \"string\"}}}",
  )
  let data = @json.parse("[\"foo\", 42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g2] A $ref to a $dynamicAnchor in the same schema resource behaves like a normal $ref to an $a - An array of strings is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/ref-dynamicAnchor-same-schema/root\", \"type\": \"array\", \"items\": {\"$ref\": \"#items\"}, \"$defs\": {\"foo\": {\"$dynamicAnchor\": \"items\", \"type\": \"string\"}}}",
  )
  let data = @json.parse("[\"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g2] A $ref to a $dynamicAnchor in the same schema resource behaves like a normal $ref to an $a - An array containing non-strings is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/ref-dynamicAnchor-same-schema/root\", \"type\": \"array\", \"items\": {\"$ref\": \"#items\"}, \"$defs\": {\"foo\": {\"$dynamicAnchor\": \"items\", \"type\": \"string\"}}}",
  )
  let data = @json.parse("[\"foo\", 42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g3] A $dynamicRef resolves to the first $dynamicAnchor still in scope that is encountered when - An array of strings is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/typical-dynamic-resolution/root\", \"$ref\": \"list\", \"$defs\": {\"foo\": {\"$dynamicAnchor\": \"items\", \"type\": \"string\"}, \"list\": {\"$id\": \"list\", \"type\": \"array\", \"items\": {\"$dynamicRef\": \"#items\"}, \"$defs\": {\"items\": {\"$comment\": \"This is only needed to satisfy the bookending requirement\", \"$dynamicAnchor\": \"items\"}}}}}",
  )
  let data = @json.parse("[\"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g3] A $dynamicRef resolves to the first $dynamicAnchor still in scope that is encountered when - An array containing non-strings is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/typical-dynamic-resolution/root\", \"$ref\": \"list\", \"$defs\": {\"foo\": {\"$dynamicAnchor\": \"items\", \"type\": \"string\"}, \"list\": {\"$id\": \"list\", \"type\": \"array\", \"items\": {\"$dynamicRef\": \"#items\"}, \"$defs\": {\"items\": {\"$comment\": \"This is only needed to satisfy the bookending requirement\", \"$dynamicAnchor\": \"items\"}}}}}",
  )
  let data = @json.parse("[\"foo\", 42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g4] A $dynamicRef without anchor in fragment behaves identical to $ref - An array of strings is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamicRef-without-anchor/root\", \"$ref\": \"list\", \"$defs\": {\"foo\": {\"$dynamicAnchor\": \"items\", \"type\": \"string\"}, \"list\": {\"$id\": \"list\", \"type\": \"array\", \"items\": {\"$dynamicRef\": \"#/$defs/items\"}, \"$defs\": {\"items\": {\"$comment\": \"This is only needed to satisfy the bookending requirement\", \"$dynamicAnchor\": \"items\", \"type\": \"number\"}}}}}",
  )
  let data = @json.parse("[\"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g4] A $dynamicRef without anchor in fragment behaves identical to $ref - An array of numbers is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamicRef-without-anchor/root\", \"$ref\": \"list\", \"$defs\": {\"foo\": {\"$dynamicAnchor\": \"items\", \"type\": \"string\"}, \"list\": {\"$id\": \"list\", \"type\": \"array\", \"items\": {\"$dynamicRef\": \"#/$defs/items\"}, \"$defs\": {\"items\": {\"$comment\": \"This is only needed to satisfy the bookending requirement\", \"$dynamicAnchor\": \"items\", \"type\": \"number\"}}}}}",
  )
  let data = @json.parse("[24, 42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g5] A $dynamicRef with intermediate scopes that don't include a matching $dynamicAnchor does n - An array of strings is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamic-resolution-with-intermediate-scopes/root\", \"$ref\": \"intermediate-scope\", \"$defs\": {\"foo\": {\"$dynamicAnchor\": \"items\", \"type\": \"string\"}, \"intermediate-scope\": {\"$id\": \"intermediate-scope\", \"$ref\": \"list\"}, \"list\": {\"$id\": \"list\", \"type\": \"array\", \"items\": {\"$dynamicRef\": \"#items\"}, \"$defs\": {\"items\": {\"$comment\": \"This is only needed to satisfy the bookending requirement\", \"$dynamicAnchor\": \"items\"}}}}}",
  )
  let data = @json.parse("[\"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g5] A $dynamicRef with intermediate scopes that don't include a matching $dynamicAnchor does n - An array containing non-strings is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamic-resolution-with-intermediate-scopes/root\", \"$ref\": \"intermediate-scope\", \"$defs\": {\"foo\": {\"$dynamicAnchor\": \"items\", \"type\": \"string\"}, \"intermediate-scope\": {\"$id\": \"intermediate-scope\", \"$ref\": \"list\"}, \"list\": {\"$id\": \"list\", \"type\": \"array\", \"items\": {\"$dynamicRef\": \"#items\"}, \"$defs\": {\"items\": {\"$comment\": \"This is only needed to satisfy the bookending requirement\", \"$dynamicAnchor\": \"items\"}}}}}",
  )
  let data = @json.parse("[\"foo\", 42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g6] An $anchor with the same name as a $dynamicAnchor is not used for dynamic scope resolution - Any array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamic-resolution-ignores-anchors/root\", \"$ref\": \"list\", \"$defs\": {\"foo\": {\"$anchor\": \"items\", \"type\": \"string\"}, \"list\": {\"$id\": \"list\", \"type\": \"array\", \"items\": {\"$dynamicRef\": \"#items\"}, \"$defs\": {\"items\": {\"$comment\": \"This is only needed to satisfy the bookending requirement\", \"$dynamicAnchor\": \"items\"}}}}}",
  )
  let data = @json.parse("[\"foo\", 42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g7] A $dynamicRef without a matching $dynamicAnchor in the same schema resource behaves like a - Any array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamic-resolution-without-bookend/root\", \"$ref\": \"list\", \"$defs\": {\"foo\": {\"$dynamicAnchor\": \"items\", \"type\": \"string\"}, \"list\": {\"$id\": \"list\", \"type\": \"array\", \"items\": {\"$dynamicRef\": \"#items\"}, \"$defs\": {\"items\": {\"$comment\": \"This is only needed to give the reference somewhere to resolve to when it behaves like $ref\", \"$anchor\": \"items\"}}}}}",
  )
  let data = @json.parse("[\"foo\", 42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g8] A $dynamicRef with a non-matching $dynamicAnchor in the same schema resource behaves like  - Any array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/unmatched-dynamic-anchor/root\", \"$ref\": \"list\", \"$defs\": {\"foo\": {\"$dynamicAnchor\": \"items\", \"type\": \"string\"}, \"list\": {\"$id\": \"list\", \"type\": \"array\", \"items\": {\"$dynamicRef\": \"#items\"}, \"$defs\": {\"items\": {\"$comment\": \"This is only needed to give the reference somewhere to resolve to when it behaves like $ref\", \"$anchor\": \"items\", \"$dynamicAnchor\": \"foo\"}}}}}",
  )
  let data = @json.parse("[\"foo\", 42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g9] A $dynamicRef that initially resolves to a schema with a matching $dynamicAnchor resolves  - The recursive part is valid against the root" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/relative-dynamic-reference/root\", \"$dynamicAnchor\": \"meta\", \"type\": \"object\", \"properties\": {\"foo\": {\"const\": \"pass\"}}, \"$ref\": \"extended\", \"$defs\": {\"extended\": {\"$id\": \"extended\", \"$dynamicAnchor\": \"meta\", \"type\": \"object\", \"properties\": {\"bar\": {\"$ref\": \"bar\"}}}, \"bar\": {\"$id\": \"bar\", \"type\": \"object\", \"properties\": {\"baz\": {\"$dynamicRef\": \"extended#meta\"}}}}}",
  )
  let data = @json.parse(
    "{\"foo\": \"pass\", \"bar\": {\"baz\": {\"foo\": \"pass\"}}}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g9] A $dynamicRef that initially resolves to a schema with a matching $dynamicAnchor resolves  - The recursive part is not valid against the root" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/relative-dynamic-reference/root\", \"$dynamicAnchor\": \"meta\", \"type\": \"object\", \"properties\": {\"foo\": {\"const\": \"pass\"}}, \"$ref\": \"extended\", \"$defs\": {\"extended\": {\"$id\": \"extended\", \"$dynamicAnchor\": \"meta\", \"type\": \"object\", \"properties\": {\"bar\": {\"$ref\": \"bar\"}}}, \"bar\": {\"$id\": \"bar\", \"type\": \"object\", \"properties\": {\"baz\": {\"$dynamicRef\": \"extended#meta\"}}}}}",
  )
  let data = @json.parse(
    "{\"foo\": \"pass\", \"bar\": {\"baz\": {\"foo\": \"fail\"}}}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g10] A $dynamicRef that initially resolves to a schema without a matching $dynamicAnchor behave - The recursive part doesn't need to validate against the root" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/relative-dynamic-reference-without-bookend/root\", \"$dynamicAnchor\": \"meta\", \"type\": \"object\", \"properties\": {\"foo\": {\"const\": \"pass\"}}, \"$ref\": \"extended\", \"$defs\": {\"extended\": {\"$id\": \"extended\", \"$anchor\": \"meta\", \"type\": \"object\", \"properties\": {\"bar\": {\"$ref\": \"bar\"}}}, \"bar\": {\"$id\": \"bar\", \"type\": \"object\", \"properties\": {\"baz\": {\"$dynamicRef\": \"extended#meta\"}}}}}",
  )
  let data = @json.parse(
    "{\"foo\": \"pass\", \"bar\": {\"baz\": {\"foo\": \"fail\"}}}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g11] multiple dynamic paths to the $dynamicRef keyword - number list with number values" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamic-ref-with-multiple-paths/main\", \"if\": {\"properties\": {\"kindOfList\": {\"const\": \"numbers\"}}, \"required\": [\"kindOfList\"]}, \"then\": {\"$ref\": \"numberList\"}, \"else\": {\"$ref\": \"stringList\"}, \"$defs\": {\"genericList\": {\"$id\": \"genericList\", \"properties\": {\"list\": {\"items\": {\"$dynamicRef\": \"#itemType\"}}}, \"$defs\": {\"defaultItemType\": {\"$comment\": \"Only needed to satisfy bookending requirement\", \"$dynamicAnchor\": \"itemType\"}}}, \"numberList\": {\"$id\": \"numberList\", \"$defs\": {\"itemType\": {\"$dynamicAnchor\": \"itemType\", \"type\": \"number\"}}, \"$ref\": \"genericList\"}, \"stringList\": {\"$id\": \"stringList\", \"$defs\": {\"itemType\": {\"$dynamicAnchor\": \"itemType\", \"type\": \"string\"}}, \"$ref\": \"genericList\"}}}",
  )
  let data = @json.parse("{\"kindOfList\": \"numbers\", \"list\": [1.1]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g11] multiple dynamic paths to the $dynamicRef keyword - number list with string values" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamic-ref-with-multiple-paths/main\", \"if\": {\"properties\": {\"kindOfList\": {\"const\": \"numbers\"}}, \"required\": [\"kindOfList\"]}, \"then\": {\"$ref\": \"numberList\"}, \"else\": {\"$ref\": \"stringList\"}, \"$defs\": {\"genericList\": {\"$id\": \"genericList\", \"properties\": {\"list\": {\"items\": {\"$dynamicRef\": \"#itemType\"}}}, \"$defs\": {\"defaultItemType\": {\"$comment\": \"Only needed to satisfy bookending requirement\", \"$dynamicAnchor\": \"itemType\"}}}, \"numberList\": {\"$id\": \"numberList\", \"$defs\": {\"itemType\": {\"$dynamicAnchor\": \"itemType\", \"type\": \"number\"}}, \"$ref\": \"genericList\"}, \"stringList\": {\"$id\": \"stringList\", \"$defs\": {\"itemType\": {\"$dynamicAnchor\": \"itemType\", \"type\": \"string\"}}, \"$ref\": \"genericList\"}}}",
  )
  let data = @json.parse("{\"kindOfList\": \"numbers\", \"list\": [\"foo\"]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g11] multiple dynamic paths to the $dynamicRef keyword - string list with number values" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamic-ref-with-multiple-paths/main\", \"if\": {\"properties\": {\"kindOfList\": {\"const\": \"numbers\"}}, \"required\": [\"kindOfList\"]}, \"then\": {\"$ref\": \"numberList\"}, \"else\": {\"$ref\": \"stringList\"}, \"$defs\": {\"genericList\": {\"$id\": \"genericList\", \"properties\": {\"list\": {\"items\": {\"$dynamicRef\": \"#itemType\"}}}, \"$defs\": {\"defaultItemType\": {\"$comment\": \"Only needed to satisfy bookending requirement\", \"$dynamicAnchor\": \"itemType\"}}}, \"numberList\": {\"$id\": \"numberList\", \"$defs\": {\"itemType\": {\"$dynamicAnchor\": \"itemType\", \"type\": \"number\"}}, \"$ref\": \"genericList\"}, \"stringList\": {\"$id\": \"stringList\", \"$defs\": {\"itemType\": {\"$dynamicAnchor\": \"itemType\", \"type\": \"string\"}}, \"$ref\": \"genericList\"}}}",
  )
  let data = @json.parse("{\"kindOfList\": \"strings\", \"list\": [1.1]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g11] multiple dynamic paths to the $dynamicRef keyword - string list with string values" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamic-ref-with-multiple-paths/main\", \"if\": {\"properties\": {\"kindOfList\": {\"const\": \"numbers\"}}, \"required\": [\"kindOfList\"]}, \"then\": {\"$ref\": \"numberList\"}, \"else\": {\"$ref\": \"stringList\"}, \"$defs\": {\"genericList\": {\"$id\": \"genericList\", \"properties\": {\"list\": {\"items\": {\"$dynamicRef\": \"#itemType\"}}}, \"$defs\": {\"defaultItemType\": {\"$comment\": \"Only needed to satisfy bookending requirement\", \"$dynamicAnchor\": \"itemType\"}}}, \"numberList\": {\"$id\": \"numberList\", \"$defs\": {\"itemType\": {\"$dynamicAnchor\": \"itemType\", \"type\": \"number\"}}, \"$ref\": \"genericList\"}, \"stringList\": {\"$id\": \"stringList\", \"$defs\": {\"itemType\": {\"$dynamicAnchor\": \"itemType\", \"type\": \"string\"}}, \"$ref\": \"genericList\"}}}",
  )
  let data = @json.parse("{\"kindOfList\": \"strings\", \"list\": [\"foo\"]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g12] after leaving a dynamic scope, it is not used by a $dynamicRef - string matches /$defs/thingy, but the $dynamicRef does not stop here" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamic-ref-leaving-dynamic-scope/main\", \"if\": {\"$id\": \"first_scope\", \"$defs\": {\"thingy\": {\"$comment\": \"this is first_scope#thingy\", \"$dynamicAnchor\": \"thingy\", \"type\": \"number\"}}}, \"then\": {\"$id\": \"second_scope\", \"$ref\": \"start\", \"$defs\": {\"thingy\": {\"$comment\": \"this is second_scope#thingy, the final destination of the $dynamicRef\", \"$dynamicAnchor\": \"thingy\", \"type\": \"null\"}}}, \"$defs\": {\"start\": {\"$comment\": \"this is the landing spot from $ref\", \"$id\": \"start\", \"$dynamicRef\": \"inner_scope#thingy\"}, \"thingy\": {\"$comment\": \"this is the first stop for the $dynamicRef\", \"$id\": \"inner_scope\", \"$dynamicAnchor\": \"thingy\", \"type\": \"string\"}}}",
  )
  let data = @json.parse("\"a string\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g12] after leaving a dynamic scope, it is not used by a $dynamicRef - first_scope is not in dynamic scope for the $dynamicRef" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamic-ref-leaving-dynamic-scope/main\", \"if\": {\"$id\": \"first_scope\", \"$defs\": {\"thingy\": {\"$comment\": \"this is first_scope#thingy\", \"$dynamicAnchor\": \"thingy\", \"type\": \"number\"}}}, \"then\": {\"$id\": \"second_scope\", \"$ref\": \"start\", \"$defs\": {\"thingy\": {\"$comment\": \"this is second_scope#thingy, the final destination of the $dynamicRef\", \"$dynamicAnchor\": \"thingy\", \"type\": \"null\"}}}, \"$defs\": {\"start\": {\"$comment\": \"this is the landing spot from $ref\", \"$id\": \"start\", \"$dynamicRef\": \"inner_scope#thingy\"}, \"thingy\": {\"$comment\": \"this is the first stop for the $dynamicRef\", \"$id\": \"inner_scope\", \"$dynamicAnchor\": \"thingy\", \"type\": \"string\"}}}",
  )
  let data = @json.parse("42")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g12] after leaving a dynamic scope, it is not used by a $dynamicRef - /then/$defs/thingy is the final stop for the $dynamicRef" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamic-ref-leaving-dynamic-scope/main\", \"if\": {\"$id\": \"first_scope\", \"$defs\": {\"thingy\": {\"$comment\": \"this is first_scope#thingy\", \"$dynamicAnchor\": \"thingy\", \"type\": \"number\"}}}, \"then\": {\"$id\": \"second_scope\", \"$ref\": \"start\", \"$defs\": {\"thingy\": {\"$comment\": \"this is second_scope#thingy, the final destination of the $dynamicRef\", \"$dynamicAnchor\": \"thingy\", \"type\": \"null\"}}}, \"$defs\": {\"start\": {\"$comment\": \"this is the landing spot from $ref\", \"$id\": \"start\", \"$dynamicRef\": \"inner_scope#thingy\"}, \"thingy\": {\"$comment\": \"this is the first stop for the $dynamicRef\", \"$id\": \"inner_scope\", \"$dynamicAnchor\": \"thingy\", \"type\": \"string\"}}}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g13] strict-tree schema, guards against misspelled properties - instance with misspelled field" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/strict-tree.json\", \"$dynamicAnchor\": \"node\", \"$ref\": \"tree.json\", \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"children\": [{\"daat\": 1}]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g13] strict-tree schema, guards against misspelled properties - instance with correct field" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/strict-tree.json\", \"$dynamicAnchor\": \"node\", \"$ref\": \"tree.json\", \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"children\": [{\"data\": 1}]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g14] tests for implementation dynamic anchor and reference link - incorrect parent schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/strict-extendible.json\", \"$ref\": \"extendible-dynamic-ref.json\", \"$defs\": {\"elements\": {\"$dynamicAnchor\": \"elements\", \"properties\": {\"a\": true}, \"required\": [\"a\"], \"additionalProperties\": false}}}",
  )
  let data = @json.parse("{\"a\": true}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g14] tests for implementation dynamic anchor and reference link - incorrect extended schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/strict-extendible.json\", \"$ref\": \"extendible-dynamic-ref.json\", \"$defs\": {\"elements\": {\"$dynamicAnchor\": \"elements\", \"properties\": {\"a\": true}, \"required\": [\"a\"], \"additionalProperties\": false}}}",
  )
  let data = @json.parse("{\"elements\": [{\"b\": 1}]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g14] tests for implementation dynamic anchor and reference link - correct extended schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/strict-extendible.json\", \"$ref\": \"extendible-dynamic-ref.json\", \"$defs\": {\"elements\": {\"$dynamicAnchor\": \"elements\", \"properties\": {\"a\": true}, \"required\": [\"a\"], \"additionalProperties\": false}}}",
  )
  let data = @json.parse("{\"elements\": [{\"a\": 1}]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g15] $ref and $dynamicAnchor are independent of order - $defs first - incorrect parent schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/strict-extendible-allof-defs-first.json\", \"allOf\": [{\"$ref\": \"extendible-dynamic-ref.json\"}, {\"$defs\": {\"elements\": {\"$dynamicAnchor\": \"elements\", \"properties\": {\"a\": true}, \"required\": [\"a\"], \"additionalProperties\": false}}}]}",
  )
  let data = @json.parse("{\"a\": true}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g15] $ref and $dynamicAnchor are independent of order - $defs first - incorrect extended schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/strict-extendible-allof-defs-first.json\", \"allOf\": [{\"$ref\": \"extendible-dynamic-ref.json\"}, {\"$defs\": {\"elements\": {\"$dynamicAnchor\": \"elements\", \"properties\": {\"a\": true}, \"required\": [\"a\"], \"additionalProperties\": false}}}]}",
  )
  let data = @json.parse("{\"elements\": [{\"b\": 1}]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g15] $ref and $dynamicAnchor are independent of order - $defs first - correct extended schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/strict-extendible-allof-defs-first.json\", \"allOf\": [{\"$ref\": \"extendible-dynamic-ref.json\"}, {\"$defs\": {\"elements\": {\"$dynamicAnchor\": \"elements\", \"properties\": {\"a\": true}, \"required\": [\"a\"], \"additionalProperties\": false}}}]}",
  )
  let data = @json.parse("{\"elements\": [{\"a\": 1}]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g16] $ref and $dynamicAnchor are independent of order - $ref first - incorrect parent schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/strict-extendible-allof-ref-first.json\", \"allOf\": [{\"$defs\": {\"elements\": {\"$dynamicAnchor\": \"elements\", \"properties\": {\"a\": true}, \"required\": [\"a\"], \"additionalProperties\": false}}}, {\"$ref\": \"extendible-dynamic-ref.json\"}]}",
  )
  let data = @json.parse("{\"a\": true}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g16] $ref and $dynamicAnchor are independent of order - $ref first - incorrect extended schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/strict-extendible-allof-ref-first.json\", \"allOf\": [{\"$defs\": {\"elements\": {\"$dynamicAnchor\": \"elements\", \"properties\": {\"a\": true}, \"required\": [\"a\"], \"additionalProperties\": false}}}, {\"$ref\": \"extendible-dynamic-ref.json\"}]}",
  )
  let data = @json.parse("{\"elements\": [{\"b\": 1}]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g16] $ref and $dynamicAnchor are independent of order - $ref first - correct extended schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/strict-extendible-allof-ref-first.json\", \"allOf\": [{\"$defs\": {\"elements\": {\"$dynamicAnchor\": \"elements\", \"properties\": {\"a\": true}, \"required\": [\"a\"], \"additionalProperties\": false}}}, {\"$ref\": \"extendible-dynamic-ref.json\"}]}",
  )
  let data = @json.parse("{\"elements\": [{\"a\": 1}]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g17] $ref to $dynamicRef finds detached $dynamicAnchor - number is valid" {
  let schema = @json.parse(
    "{\"$ref\": \"http://localhost:1234/draft2020-12/detached-dynamicref.json#/$defs/foo\"}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g17] $ref to $dynamicRef finds detached $dynamicAnchor - non-number is invalid" {
  let schema = @json.parse(
    "{\"$ref\": \"http://localhost:1234/draft2020-12/detached-dynamicref.json#/$defs/foo\"}",
  )
  let data = @json.parse("\"a\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g18] $dynamicRef points to a boolean schema - follow $dynamicRef to a true schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"true\": true, \"false\": false}, \"properties\": {\"true\": {\"$dynamicRef\": \"#/$defs/true\"}, \"false\": {\"$dynamicRef\": \"#/$defs/false\"}}}",
  )
  let data = @json.parse("{\"true\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g18] $dynamicRef points to a boolean schema - follow $dynamicRef to a false schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"true\": true, \"false\": false}, \"properties\": {\"true\": {\"$dynamicRef\": \"#/$defs/true\"}, \"false\": {\"$dynamicRef\": \"#/$defs/false\"}}}",
  )
  let data = @json.parse("{\"false\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g19] $dynamicRef skips over intermediate resources - direct reference - integer property passes" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamic-ref-skips-intermediate-resource/main\", \"type\": \"object\", \"properties\": {\"bar-item\": {\"$ref\": \"item\"}}, \"$defs\": {\"bar\": {\"$id\": \"bar\", \"type\": \"array\", \"items\": {\"$ref\": \"item\"}, \"$defs\": {\"item\": {\"$id\": \"item\", \"type\": \"object\", \"properties\": {\"content\": {\"$dynamicRef\": \"#content\"}}, \"$defs\": {\"defaultContent\": {\"$dynamicAnchor\": \"content\", \"type\": \"integer\"}}}, \"content\": {\"$dynamicAnchor\": \"content\", \"type\": \"string\"}}}}}",
  )
  let data = @json.parse("{\"bar-item\": {\"content\": 42}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g19] $dynamicRef skips over intermediate resources - direct reference - string property fails" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamic-ref-skips-intermediate-resource/main\", \"type\": \"object\", \"properties\": {\"bar-item\": {\"$ref\": \"item\"}}, \"$defs\": {\"bar\": {\"$id\": \"bar\", \"type\": \"array\", \"items\": {\"$ref\": \"item\"}, \"$defs\": {\"item\": {\"$id\": \"item\", \"type\": \"object\", \"properties\": {\"content\": {\"$dynamicRef\": \"#content\"}}, \"$defs\": {\"defaultContent\": {\"$dynamicAnchor\": \"content\", \"type\": \"integer\"}}}, \"content\": {\"$dynamicAnchor\": \"content\", \"type\": \"string\"}}}}}",
  )
  let data = @json.parse("{\"bar-item\": {\"content\": \"value\"}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dynamicRef [g20] $dynamicRef avoids the root of each schema, but scopes are still registered - data is sufficient for schema at second#/$defs/length" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamic-ref-avoids-root-of-each-schema/base\", \"$ref\": \"first#/$defs/stuff\", \"$defs\": {\"first\": {\"$id\": \"first\", \"$defs\": {\"stuff\": {\"$ref\": \"second#/$defs/stuff\"}, \"length\": {\"$comment\": \"unused, because there is no $dynamicAnchor here\", \"maxLength\": 1}}}, \"second\": {\"$id\": \"second\", \"$defs\": {\"stuff\": {\"$ref\": \"third#/$defs/stuff\"}, \"length\": {\"$dynamicAnchor\": \"length\", \"maxLength\": 2}}}, \"third\": {\"$id\": \"third\", \"$defs\": {\"stuff\": {\"$dynamicRef\": \"#length\"}, \"length\": {\"$dynamicAnchor\": \"length\", \"maxLength\": 3}}}}}",
  )
  let data = @json.parse("\"hi\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dynamicRef [g20] $dynamicRef avoids the root of each schema, but scopes are still registered - data is not sufficient for schema at second#/$defs/length" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://test.json-schema.org/dynamic-ref-avoids-root-of-each-schema/base\", \"$ref\": \"first#/$defs/stuff\", \"$defs\": {\"first\": {\"$id\": \"first\", \"$defs\": {\"stuff\": {\"$ref\": \"second#/$defs/stuff\"}, \"length\": {\"$comment\": \"unused, because there is no $dynamicAnchor here\", \"maxLength\": 1}}}, \"second\": {\"$id\": \"second\", \"$defs\": {\"stuff\": {\"$ref\": \"third#/$defs/stuff\"}, \"length\": {\"$dynamicAnchor\": \"length\", \"maxLength\": 2}}}, \"third\": {\"$id\": \"third\", \"$defs\": {\"stuff\": {\"$dynamicRef\": \"#length\"}, \"length\": {\"$dynamicAnchor\": \"length\", \"maxLength\": 3}}}}}",
  )
  let data = @json.parse("\"hey\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
