// Generated from JSON-Schema-Test-Suite tests/draft2020-12/ref.json
// (vendored copy in suite/fixtures/ref.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "ref [g0] root pointer ref - match" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"$ref\": \"#\"}}, \"additionalProperties\": false}",
  )
  let data = @json.parse("{\"foo\": false}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g0] root pointer ref - recursive match" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"$ref\": \"#\"}}, \"additionalProperties\": false}",
  )
  let data = @json.parse("{\"foo\": {\"foo\": false}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g0] root pointer ref - mismatch" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"$ref\": \"#\"}}, \"additionalProperties\": false}",
  )
  let data = @json.parse("{\"bar\": false}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g0] root pointer ref - recursive mismatch" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"$ref\": \"#\"}}, \"additionalProperties\": false}",
  )
  let data = @json.parse("{\"foo\": {\"bar\": false}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g1] relative pointer ref to object - match" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"$ref\": \"#/properties/foo\"}}}",
  )
  let data = @json.parse("{\"bar\": 3}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g1] relative pointer ref to object - mismatch" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"$ref\": \"#/properties/foo\"}}}",
  )
  let data = @json.parse("{\"bar\": true}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g2] relative pointer ref to array - match array" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"integer\"}, {\"$ref\": \"#/prefixItems/0\"}]}",
  )
  let data = @json.parse("[1, 2]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g2] relative pointer ref to array - mismatch array" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"integer\"}, {\"$ref\": \"#/prefixItems/0\"}]}",
  )
  let data = @json.parse("[1, \"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g3] escaped pointer ref - slash invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"tilde~field\": {\"type\": \"integer\"}, \"slash/field\": {\"type\": \"integer\"}, \"percent%field\": {\"type\": \"integer\"}}, \"properties\": {\"tilde\": {\"$ref\": \"#/$defs/tilde~0field\"}, \"slash\": {\"$ref\": \"#/$defs/slash~1field\"}, \"percent\": {\"$ref\": \"#/$defs/percent%25field\"}}}",
  )
  let data = @json.parse("{\"slash\": \"aoeu\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g3] escaped pointer ref - tilde invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"tilde~field\": {\"type\": \"integer\"}, \"slash/field\": {\"type\": \"integer\"}, \"percent%field\": {\"type\": \"integer\"}}, \"properties\": {\"tilde\": {\"$ref\": \"#/$defs/tilde~0field\"}, \"slash\": {\"$ref\": \"#/$defs/slash~1field\"}, \"percent\": {\"$ref\": \"#/$defs/percent%25field\"}}}",
  )
  let data = @json.parse("{\"tilde\": \"aoeu\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g3] escaped pointer ref - percent invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"tilde~field\": {\"type\": \"integer\"}, \"slash/field\": {\"type\": \"integer\"}, \"percent%field\": {\"type\": \"integer\"}}, \"properties\": {\"tilde\": {\"$ref\": \"#/$defs/tilde~0field\"}, \"slash\": {\"$ref\": \"#/$defs/slash~1field\"}, \"percent\": {\"$ref\": \"#/$defs/percent%25field\"}}}",
  )
  let data = @json.parse("{\"percent\": \"aoeu\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g3] escaped pointer ref - slash valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"tilde~field\": {\"type\": \"integer\"}, \"slash/field\": {\"type\": \"integer\"}, \"percent%field\": {\"type\": \"integer\"}}, \"properties\": {\"tilde\": {\"$ref\": \"#/$defs/tilde~0field\"}, \"slash\": {\"$ref\": \"#/$defs/slash~1field\"}, \"percent\": {\"$ref\": \"#/$defs/percent%25field\"}}}",
  )
  let data = @json.parse("{\"slash\": 123}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g3] escaped pointer ref - tilde valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"tilde~field\": {\"type\": \"integer\"}, \"slash/field\": {\"type\": \"integer\"}, \"percent%field\": {\"type\": \"integer\"}}, \"properties\": {\"tilde\": {\"$ref\": \"#/$defs/tilde~0field\"}, \"slash\": {\"$ref\": \"#/$defs/slash~1field\"}, \"percent\": {\"$ref\": \"#/$defs/percent%25field\"}}}",
  )
  let data = @json.parse("{\"tilde\": 123}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g3] escaped pointer ref - percent valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"tilde~field\": {\"type\": \"integer\"}, \"slash/field\": {\"type\": \"integer\"}, \"percent%field\": {\"type\": \"integer\"}}, \"properties\": {\"tilde\": {\"$ref\": \"#/$defs/tilde~0field\"}, \"slash\": {\"$ref\": \"#/$defs/slash~1field\"}, \"percent\": {\"$ref\": \"#/$defs/percent%25field\"}}}",
  )
  let data = @json.parse("{\"percent\": 123}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g4] nested refs - nested ref valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"a\": {\"type\": \"integer\"}, \"b\": {\"$ref\": \"#/$defs/a\"}, \"c\": {\"$ref\": \"#/$defs/b\"}}, \"$ref\": \"#/$defs/c\"}",
  )
  let data = @json.parse("5")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g4] nested refs - nested ref invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"a\": {\"type\": \"integer\"}, \"b\": {\"$ref\": \"#/$defs/a\"}, \"c\": {\"$ref\": \"#/$defs/b\"}}, \"$ref\": \"#/$defs/c\"}",
  )
  let data = @json.parse("\"a\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g5] ref applies alongside sibling keywords - ref valid, maxItems valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"reffed\": {\"type\": \"array\"}}, \"properties\": {\"foo\": {\"$ref\": \"#/$defs/reffed\", \"maxItems\": 2}}}",
  )
  let data = @json.parse("{\"foo\": []}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g5] ref applies alongside sibling keywords - ref valid, maxItems invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"reffed\": {\"type\": \"array\"}}, \"properties\": {\"foo\": {\"$ref\": \"#/$defs/reffed\", \"maxItems\": 2}}}",
  )
  let data = @json.parse("{\"foo\": [1, 2, 3]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g5] ref applies alongside sibling keywords - ref invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"reffed\": {\"type\": \"array\"}}, \"properties\": {\"foo\": {\"$ref\": \"#/$defs/reffed\", \"maxItems\": 2}}}",
  )
  let data = @json.parse("{\"foo\": \"string\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g6] remote ref, containing refs itself - remote ref valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"https://json-schema.org/draft/2020-12/schema\"}",
  )
  let data = @json.parse("{\"minLength\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g6] remote ref, containing refs itself - remote ref invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"https://json-schema.org/draft/2020-12/schema\"}",
  )
  let data = @json.parse("{\"minLength\": -1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g7] property named $ref that is not a reference - property named $ref valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"$ref\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"$ref\": \"a\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g7] property named $ref that is not a reference - property named $ref invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"$ref\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"$ref\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g8] property named $ref, containing an actual $ref - property named $ref valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"$ref\": {\"$ref\": \"#/$defs/is-string\"}}, \"$defs\": {\"is-string\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"$ref\": \"a\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g8] property named $ref, containing an actual $ref - property named $ref invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"$ref\": {\"$ref\": \"#/$defs/is-string\"}}, \"$defs\": {\"is-string\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"$ref\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g9] $ref to boolean schema true - any value is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"#/$defs/bool\", \"$defs\": {\"bool\": true}}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g10] $ref to boolean schema false - any value is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"#/$defs/bool\", \"$defs\": {\"bool\": false}}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g11] Recursive references between schemas - valid tree" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/tree\", \"description\": \"tree of nodes\", \"type\": \"object\", \"properties\": {\"meta\": {\"type\": \"string\"}, \"nodes\": {\"type\": \"array\", \"items\": {\"$ref\": \"node\"}}}, \"required\": [\"meta\", \"nodes\"], \"$defs\": {\"node\": {\"$id\": \"http://localhost:1234/draft2020-12/node\", \"description\": \"node\", \"type\": \"object\", \"properties\": {\"value\": {\"type\": \"number\"}, \"subtree\": {\"$ref\": \"tree\"}}, \"required\": [\"value\"]}}}",
  )
  let data = @json.parse(
    "{\"meta\": \"root\", \"nodes\": [{\"value\": 1, \"subtree\": {\"meta\": \"child\", \"nodes\": [{\"value\": 1.1}, {\"value\": 1.2}]}}, {\"value\": 2, \"subtree\": {\"meta\": \"child\", \"nodes\": [{\"value\": 2.1}, {\"value\": 2.2}]}}]}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g11] Recursive references between schemas - invalid tree" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/tree\", \"description\": \"tree of nodes\", \"type\": \"object\", \"properties\": {\"meta\": {\"type\": \"string\"}, \"nodes\": {\"type\": \"array\", \"items\": {\"$ref\": \"node\"}}}, \"required\": [\"meta\", \"nodes\"], \"$defs\": {\"node\": {\"$id\": \"http://localhost:1234/draft2020-12/node\", \"description\": \"node\", \"type\": \"object\", \"properties\": {\"value\": {\"type\": \"number\"}, \"subtree\": {\"$ref\": \"tree\"}}, \"required\": [\"value\"]}}}",
  )
  let data = @json.parse(
    "{\"meta\": \"root\", \"nodes\": [{\"value\": 1, \"subtree\": {\"meta\": \"child\", \"nodes\": [{\"value\": \"string is invalid\"}, {\"value\": 1.2}]}}, {\"value\": 2, \"subtree\": {\"meta\": \"child\", \"nodes\": [{\"value\": 2.1}, {\"value\": 2.2}]}}]}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g12] refs with quote - object with numbers is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\\\"bar\": {\"$ref\": \"#/$defs/foo%22bar\"}}, \"$defs\": {\"foo\\\"bar\": {\"type\": \"number\"}}}",
  )
  let data = @json.parse("{\"foo\\\"bar\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g12] refs with quote - object with strings is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\\\"bar\": {\"$ref\": \"#/$defs/foo%22bar\"}}, \"$defs\": {\"foo\\\"bar\": {\"type\": \"number\"}}}",
  )
  let data = @json.parse("{\"foo\\\"bar\": \"1\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g13] ref creates new scope when adjacent to keywords - referenced subschema doesn't see annotations from properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"A\": {\"unevaluatedProperties\": false}}, \"properties\": {\"prop1\": {\"type\": \"string\"}}, \"$ref\": \"#/$defs/A\"}",
  )
  let data = @json.parse("{\"prop1\": \"match\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g14] naive replacement of $ref with its destination is not correct - do not evaluate the $ref inside the enum, matching any string" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"a_string\": {\"type\": \"string\"}}, \"enum\": [{\"$ref\": \"#/$defs/a_string\"}]}",
  )
  let data = @json.parse("\"this is a string\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g14] naive replacement of $ref with its destination is not correct - do not evaluate the $ref inside the enum, definition exact match" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"a_string\": {\"type\": \"string\"}}, \"enum\": [{\"$ref\": \"#/$defs/a_string\"}]}",
  )
  let data = @json.parse("{\"type\": \"string\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g14] naive replacement of $ref with its destination is not correct - match the enum exactly" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"a_string\": {\"type\": \"string\"}}, \"enum\": [{\"$ref\": \"#/$defs/a_string\"}]}",
  )
  let data = @json.parse("{\"$ref\": \"#/$defs/a_string\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g15] refs with relative uris and defs - invalid on inner field" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://example.com/schema-relative-uri-defs1.json\", \"properties\": {\"foo\": {\"$id\": \"schema-relative-uri-defs2.json\", \"$defs\": {\"inner\": {\"properties\": {\"bar\": {\"type\": \"string\"}}}}, \"$ref\": \"#/$defs/inner\"}}, \"$ref\": \"schema-relative-uri-defs2.json\"}",
  )
  let data = @json.parse("{\"foo\": {\"bar\": 1}, \"bar\": \"a\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g15] refs with relative uris and defs - invalid on outer field" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://example.com/schema-relative-uri-defs1.json\", \"properties\": {\"foo\": {\"$id\": \"schema-relative-uri-defs2.json\", \"$defs\": {\"inner\": {\"properties\": {\"bar\": {\"type\": \"string\"}}}}, \"$ref\": \"#/$defs/inner\"}}, \"$ref\": \"schema-relative-uri-defs2.json\"}",
  )
  let data = @json.parse("{\"foo\": {\"bar\": \"a\"}, \"bar\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g15] refs with relative uris and defs - valid on both fields" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://example.com/schema-relative-uri-defs1.json\", \"properties\": {\"foo\": {\"$id\": \"schema-relative-uri-defs2.json\", \"$defs\": {\"inner\": {\"properties\": {\"bar\": {\"type\": \"string\"}}}}, \"$ref\": \"#/$defs/inner\"}}, \"$ref\": \"schema-relative-uri-defs2.json\"}",
  )
  let data = @json.parse("{\"foo\": {\"bar\": \"a\"}, \"bar\": \"a\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g16] relative refs with absolute uris and defs - invalid on inner field" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://example.com/schema-refs-absolute-uris-defs1.json\", \"properties\": {\"foo\": {\"$id\": \"http://example.com/schema-refs-absolute-uris-defs2.json\", \"$defs\": {\"inner\": {\"properties\": {\"bar\": {\"type\": \"string\"}}}}, \"$ref\": \"#/$defs/inner\"}}, \"$ref\": \"schema-refs-absolute-uris-defs2.json\"}",
  )
  let data = @json.parse("{\"foo\": {\"bar\": 1}, \"bar\": \"a\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g16] relative refs with absolute uris and defs - invalid on outer field" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://example.com/schema-refs-absolute-uris-defs1.json\", \"properties\": {\"foo\": {\"$id\": \"http://example.com/schema-refs-absolute-uris-defs2.json\", \"$defs\": {\"inner\": {\"properties\": {\"bar\": {\"type\": \"string\"}}}}, \"$ref\": \"#/$defs/inner\"}}, \"$ref\": \"schema-refs-absolute-uris-defs2.json\"}",
  )
  let data = @json.parse("{\"foo\": {\"bar\": \"a\"}, \"bar\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g16] relative refs with absolute uris and defs - valid on both fields" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://example.com/schema-refs-absolute-uris-defs1.json\", \"properties\": {\"foo\": {\"$id\": \"http://example.com/schema-refs-absolute-uris-defs2.json\", \"$defs\": {\"inner\": {\"properties\": {\"bar\": {\"type\": \"string\"}}}}, \"$ref\": \"#/$defs/inner\"}}, \"$ref\": \"schema-refs-absolute-uris-defs2.json\"}",
  )
  let data = @json.parse("{\"foo\": {\"bar\": \"a\"}, \"bar\": \"a\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g17] $id must be resolved against nearest parent, not just immediate parent - number is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://example.com/a.json\", \"$defs\": {\"x\": {\"$id\": \"http://example.com/b/c.json\", \"not\": {\"$defs\": {\"y\": {\"$id\": \"d.json\", \"type\": \"number\"}}}}}, \"allOf\": [{\"$ref\": \"http://example.com/b/d.json\"}]}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g17] $id must be resolved against nearest parent, not just immediate parent - non-number is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://example.com/a.json\", \"$defs\": {\"x\": {\"$id\": \"http://example.com/b/c.json\", \"not\": {\"$defs\": {\"y\": {\"$id\": \"d.json\", \"type\": \"number\"}}}}}, \"allOf\": [{\"$ref\": \"http://example.com/b/d.json\"}]}",
  )
  let data = @json.parse("\"a\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g18] order of evaluation: $id and $ref - data is valid against first definition" {
  let schema = @json.parse(
    "{\"$comment\": \"$id must be evaluated before $ref to get the proper $ref destination\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://example.com/draft2020-12/ref-and-id1/base.json\", \"$ref\": \"int.json\", \"$defs\": {\"bigint\": {\"$comment\": \"canonical uri: https://example.com/ref-and-id1/int.json\", \"$id\": \"int.json\", \"maximum\": 10}, \"smallint\": {\"$comment\": \"canonical uri: https://example.com/ref-and-id1-int.json\", \"$id\": \"/draft2020-12/ref-and-id1-int.json\", \"maximum\": 2}}}",
  )
  let data = @json.parse("5")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g18] order of evaluation: $id and $ref - data is invalid against first definition" {
  let schema = @json.parse(
    "{\"$comment\": \"$id must be evaluated before $ref to get the proper $ref destination\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://example.com/draft2020-12/ref-and-id1/base.json\", \"$ref\": \"int.json\", \"$defs\": {\"bigint\": {\"$comment\": \"canonical uri: https://example.com/ref-and-id1/int.json\", \"$id\": \"int.json\", \"maximum\": 10}, \"smallint\": {\"$comment\": \"canonical uri: https://example.com/ref-and-id1-int.json\", \"$id\": \"/draft2020-12/ref-and-id1-int.json\", \"maximum\": 2}}}",
  )
  let data = @json.parse("50")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g19] order of evaluation: $id and $anchor and $ref - data is valid against first definition" {
  let schema = @json.parse(
    "{\"$comment\": \"$id must be evaluated before $ref to get the proper $ref destination\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://example.com/draft2020-12/ref-and-id2/base.json\", \"$ref\": \"#bigint\", \"$defs\": {\"bigint\": {\"$comment\": \"canonical uri: /ref-and-id2/base.json#/$defs/bigint; another valid uri for this location: /ref-and-id2/base.json#bigint\", \"$anchor\": \"bigint\", \"maximum\": 10}, \"smallint\": {\"$comment\": \"canonical uri: https://example.com/ref-and-id2#/$defs/smallint; another valid uri for this location: https://example.com/ref-and-id2/#bigint\", \"$id\": \"https://example.com/draft2020-12/ref-and-id2/\", \"$anchor\": \"bigint\", \"maximum\": 2}}}",
  )
  let data = @json.parse("5")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g19] order of evaluation: $id and $anchor and $ref - data is invalid against first definition" {
  let schema = @json.parse(
    "{\"$comment\": \"$id must be evaluated before $ref to get the proper $ref destination\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://example.com/draft2020-12/ref-and-id2/base.json\", \"$ref\": \"#bigint\", \"$defs\": {\"bigint\": {\"$comment\": \"canonical uri: /ref-and-id2/base.json#/$defs/bigint; another valid uri for this location: /ref-and-id2/base.json#bigint\", \"$anchor\": \"bigint\", \"maximum\": 10}, \"smallint\": {\"$comment\": \"canonical uri: https://example.com/ref-and-id2#/$defs/smallint; another valid uri for this location: https://example.com/ref-and-id2/#bigint\", \"$id\": \"https://example.com/draft2020-12/ref-and-id2/\", \"$anchor\": \"bigint\", \"maximum\": 2}}}",
  )
  let data = @json.parse("50")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g20] order of evaluation: $id and $ref on nested schema - data is valid against nested sibling" {
  let schema = @json.parse(
    "{\"$comment\": \"$id must be evaluated before $ref to get the proper $ref destination\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://example.com/draft2020-12/ref-and-id3/base.json\", \"$ref\": \"nested/foo.json\", \"$defs\": {\"foo\": {\"$comment\": \"canonical uri: https://example.com/draft2020-12/ref-and-id3/nested/foo.json\", \"$id\": \"nested/foo.json\", \"$ref\": \"./bar.json\"}, \"bar\": {\"$comment\": \"canonical uri: https://example.com/draft2020-12/ref-and-id3/nested/bar.json\", \"$id\": \"nested/bar.json\", \"type\": \"number\"}}}",
  )
  let data = @json.parse("5")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g20] order of evaluation: $id and $ref on nested schema - data is invalid against nested sibling" {
  let schema = @json.parse(
    "{\"$comment\": \"$id must be evaluated before $ref to get the proper $ref destination\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://example.com/draft2020-12/ref-and-id3/base.json\", \"$ref\": \"nested/foo.json\", \"$defs\": {\"foo\": {\"$comment\": \"canonical uri: https://example.com/draft2020-12/ref-and-id3/nested/foo.json\", \"$id\": \"nested/foo.json\", \"$ref\": \"./bar.json\"}, \"bar\": {\"$comment\": \"canonical uri: https://example.com/draft2020-12/ref-and-id3/nested/bar.json\", \"$id\": \"nested/bar.json\", \"type\": \"number\"}}}",
  )
  let data = @json.parse("\"a\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g21] simple URN base URI with $ref via the URN - valid under the URN IDed schema" {
  let schema = @json.parse(
    "{\"$comment\": \"URIs do not have to have HTTP(s) schemes\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"urn:uuid:deadbeef-1234-ffff-ffff-4321feebdaed\", \"minimum\": 30, \"properties\": {\"foo\": {\"$ref\": \"urn:uuid:deadbeef-1234-ffff-ffff-4321feebdaed\"}}}",
  )
  let data = @json.parse("{\"foo\": 37}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g21] simple URN base URI with $ref via the URN - invalid under the URN IDed schema" {
  let schema = @json.parse(
    "{\"$comment\": \"URIs do not have to have HTTP(s) schemes\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"urn:uuid:deadbeef-1234-ffff-ffff-4321feebdaed\", \"minimum\": 30, \"properties\": {\"foo\": {\"$ref\": \"urn:uuid:deadbeef-1234-ffff-ffff-4321feebdaed\"}}}",
  )
  let data = @json.parse("{\"foo\": 12}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g22] simple URN base URI with JSON pointer - a string is valid" {
  let schema = @json.parse(
    "{\"$comment\": \"URIs do not have to have HTTP(s) schemes\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"urn:uuid:deadbeef-1234-00ff-ff00-4321feebdaed\", \"properties\": {\"foo\": {\"$ref\": \"#/$defs/bar\"}}, \"$defs\": {\"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"foo\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g22] simple URN base URI with JSON pointer - a non-string is invalid" {
  let schema = @json.parse(
    "{\"$comment\": \"URIs do not have to have HTTP(s) schemes\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"urn:uuid:deadbeef-1234-00ff-ff00-4321feebdaed\", \"properties\": {\"foo\": {\"$ref\": \"#/$defs/bar\"}}, \"$defs\": {\"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"foo\": 12}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g23] URN base URI with NSS - a string is valid" {
  let schema = @json.parse(
    "{\"$comment\": \"RFC 8141 §2.2\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"urn:example:1/406/47452/2\", \"properties\": {\"foo\": {\"$ref\": \"#/$defs/bar\"}}, \"$defs\": {\"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"foo\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g23] URN base URI with NSS - a non-string is invalid" {
  let schema = @json.parse(
    "{\"$comment\": \"RFC 8141 §2.2\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"urn:example:1/406/47452/2\", \"properties\": {\"foo\": {\"$ref\": \"#/$defs/bar\"}}, \"$defs\": {\"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"foo\": 12}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g24] URN base URI with r-component - a string is valid" {
  let schema = @json.parse(
    "{\"$comment\": \"RFC 8141 §2.3.1\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"urn:example:foo-bar-baz-qux?+CCResolve:cc=uk\", \"properties\": {\"foo\": {\"$ref\": \"#/$defs/bar\"}}, \"$defs\": {\"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"foo\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g24] URN base URI with r-component - a non-string is invalid" {
  let schema = @json.parse(
    "{\"$comment\": \"RFC 8141 §2.3.1\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"urn:example:foo-bar-baz-qux?+CCResolve:cc=uk\", \"properties\": {\"foo\": {\"$ref\": \"#/$defs/bar\"}}, \"$defs\": {\"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"foo\": 12}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g25] URN base URI with q-component - a string is valid" {
  let schema = @json.parse(
    "{\"$comment\": \"RFC 8141 §2.3.2\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"urn:example:weather?=op=map&lat=39.56&lon=-104.85&datetime=1969-07-21T02:56:15Z\", \"properties\": {\"foo\": {\"$ref\": \"#/$defs/bar\"}}, \"$defs\": {\"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"foo\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g25] URN base URI with q-component - a non-string is invalid" {
  let schema = @json.parse(
    "{\"$comment\": \"RFC 8141 §2.3.2\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"urn:example:weather?=op=map&lat=39.56&lon=-104.85&datetime=1969-07-21T02:56:15Z\", \"properties\": {\"foo\": {\"$ref\": \"#/$defs/bar\"}}, \"$defs\": {\"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"foo\": 12}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g26] URN base URI with URN and JSON pointer ref - a string is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"urn:uuid:deadbeef-1234-0000-0000-4321feebdaed\", \"properties\": {\"foo\": {\"$ref\": \"urn:uuid:deadbeef-1234-0000-0000-4321feebdaed#/$defs/bar\"}}, \"$defs\": {\"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"foo\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g26] URN base URI with URN and JSON pointer ref - a non-string is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"urn:uuid:deadbeef-1234-0000-0000-4321feebdaed\", \"properties\": {\"foo\": {\"$ref\": \"urn:uuid:deadbeef-1234-0000-0000-4321feebdaed#/$defs/bar\"}}, \"$defs\": {\"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"foo\": 12}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g27] URN base URI with URN and anchor ref - a string is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"urn:uuid:deadbeef-1234-ff00-00ff-4321feebdaed\", \"properties\": {\"foo\": {\"$ref\": \"urn:uuid:deadbeef-1234-ff00-00ff-4321feebdaed#something\"}}, \"$defs\": {\"bar\": {\"$anchor\": \"something\", \"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"foo\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g27] URN base URI with URN and anchor ref - a non-string is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"urn:uuid:deadbeef-1234-ff00-00ff-4321feebdaed\", \"properties\": {\"foo\": {\"$ref\": \"urn:uuid:deadbeef-1234-ff00-00ff-4321feebdaed#something\"}}, \"$defs\": {\"bar\": {\"$anchor\": \"something\", \"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"foo\": 12}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g28] URN ref with nested pointer ref - a string is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"urn:uuid:deadbeef-4321-ffff-ffff-1234feebdaed\", \"$defs\": {\"foo\": {\"$id\": \"urn:uuid:deadbeef-4321-ffff-ffff-1234feebdaed\", \"$defs\": {\"bar\": {\"type\": \"string\"}}, \"$ref\": \"#/$defs/bar\"}}}",
  )
  let data = @json.parse("\"bar\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g28] URN ref with nested pointer ref - a non-string is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"urn:uuid:deadbeef-4321-ffff-ffff-1234feebdaed\", \"$defs\": {\"foo\": {\"$id\": \"urn:uuid:deadbeef-4321-ffff-ffff-1234feebdaed\", \"$defs\": {\"bar\": {\"type\": \"string\"}}, \"$ref\": \"#/$defs/bar\"}}}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g29] ref to if - a non-integer is invalid due to the $ref" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"http://example.com/ref/if\", \"if\": {\"$id\": \"http://example.com/ref/if\", \"type\": \"integer\"}}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g29] ref to if - an integer is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"http://example.com/ref/if\", \"if\": {\"$id\": \"http://example.com/ref/if\", \"type\": \"integer\"}}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g30] ref to then - a non-integer is invalid due to the $ref" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"http://example.com/ref/then\", \"then\": {\"$id\": \"http://example.com/ref/then\", \"type\": \"integer\"}}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g30] ref to then - an integer is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"http://example.com/ref/then\", \"then\": {\"$id\": \"http://example.com/ref/then\", \"type\": \"integer\"}}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g31] ref to else - a non-integer is invalid due to the $ref" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"http://example.com/ref/else\", \"else\": {\"$id\": \"http://example.com/ref/else\", \"type\": \"integer\"}}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g31] ref to else - an integer is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"http://example.com/ref/else\", \"else\": {\"$id\": \"http://example.com/ref/else\", \"type\": \"integer\"}}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g32] ref with absolute-path-reference - a string is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://example.com/ref/absref.json\", \"$defs\": {\"a\": {\"$id\": \"http://example.com/ref/absref/foobar.json\", \"type\": \"number\"}, \"b\": {\"$id\": \"http://example.com/absref/foobar.json\", \"type\": \"string\"}}, \"$ref\": \"/absref/foobar.json\"}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g32] ref with absolute-path-reference - an integer is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://example.com/ref/absref.json\", \"$defs\": {\"a\": {\"$id\": \"http://example.com/ref/absref/foobar.json\", \"type\": \"number\"}, \"b\": {\"$id\": \"http://example.com/absref/foobar.json\", \"type\": \"string\"}}, \"$ref\": \"/absref/foobar.json\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g33] $id with file URI still resolves pointers - *nix - number is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"file:///folder/file.json\", \"$defs\": {\"foo\": {\"type\": \"number\"}}, \"$ref\": \"#/$defs/foo\"}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g33] $id with file URI still resolves pointers - *nix - non-number is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"file:///folder/file.json\", \"$defs\": {\"foo\": {\"type\": \"number\"}}, \"$ref\": \"#/$defs/foo\"}",
  )
  let data = @json.parse("\"a\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g34] $id with file URI still resolves pointers - windows - number is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"file:///c:/folder/file.json\", \"$defs\": {\"foo\": {\"type\": \"number\"}}, \"$ref\": \"#/$defs/foo\"}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g34] $id with file URI still resolves pointers - windows - non-number is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"file:///c:/folder/file.json\", \"$defs\": {\"foo\": {\"type\": \"number\"}}, \"$ref\": \"#/$defs/foo\"}",
  )
  let data = @json.parse("\"a\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "ref [g35] empty tokens in $ref json-pointer - number is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"\": {\"$defs\": {\"\": {\"type\": \"number\"}}}}, \"allOf\": [{\"$ref\": \"#/$defs//$defs/\"}]}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "ref [g35] empty tokens in $ref json-pointer - non-number is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"\": {\"$defs\": {\"\": {\"type\": \"number\"}}}}, \"allOf\": [{\"$ref\": \"#/$defs//$defs/\"}]}",
  )
  let data = @json.parse("\"a\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
