// Generated from JSON-Schema-Test-Suite tests/draft2020-12/enum.json
// (vendored copy in suite/fixtures/enum.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "enum [g0] simple enum validation - one of the enum is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [1, 2, 3]}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g0] simple enum validation - something else is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [1, 2, 3]}",
  )
  let data = @json.parse("4")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g1] heterogeneous enum validation - one of the enum is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [6, \"foo\", [], true, {\"foo\": 12}]}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g1] heterogeneous enum validation - something else is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [6, \"foo\", [], true, {\"foo\": 12}]}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g1] heterogeneous enum validation - objects are deep compared" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [6, \"foo\", [], true, {\"foo\": 12}]}",
  )
  let data = @json.parse("{\"foo\": false}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g1] heterogeneous enum validation - valid object matches" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [6, \"foo\", [], true, {\"foo\": 12}]}",
  )
  let data = @json.parse("{\"foo\": 12}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g1] heterogeneous enum validation - extra properties in object is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [6, \"foo\", [], true, {\"foo\": 12}]}",
  )
  let data = @json.parse("{\"foo\": 12, \"boo\": 42}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g2] heterogeneous enum-with-null validation - null is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [6, null]}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g2] heterogeneous enum-with-null validation - number is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [6, null]}",
  )
  let data = @json.parse("6")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g2] heterogeneous enum-with-null validation - something else is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [6, null]}",
  )
  let data = @json.parse("\"test\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g3] enums in properties - both properties are valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"properties\": {\"foo\": {\"enum\": [\"foo\"]}, \"bar\": {\"enum\": [\"bar\"]}}, \"required\": [\"bar\"]}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g3] enums in properties - wrong foo value" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"properties\": {\"foo\": {\"enum\": [\"foo\"]}, \"bar\": {\"enum\": [\"bar\"]}}, \"required\": [\"bar\"]}",
  )
  let data = @json.parse("{\"foo\": \"foot\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g3] enums in properties - wrong bar value" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"properties\": {\"foo\": {\"enum\": [\"foo\"]}, \"bar\": {\"enum\": [\"bar\"]}}, \"required\": [\"bar\"]}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bart\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g3] enums in properties - missing optional property is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"properties\": {\"foo\": {\"enum\": [\"foo\"]}, \"bar\": {\"enum\": [\"bar\"]}}, \"required\": [\"bar\"]}",
  )
  let data = @json.parse("{\"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g3] enums in properties - missing required property is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"properties\": {\"foo\": {\"enum\": [\"foo\"]}, \"bar\": {\"enum\": [\"bar\"]}}, \"required\": [\"bar\"]}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g3] enums in properties - missing all properties is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"properties\": {\"foo\": {\"enum\": [\"foo\"]}, \"bar\": {\"enum\": [\"bar\"]}}, \"required\": [\"bar\"]}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g4] enum with escaped characters - member 1 is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [\"foo\\nbar\", \"foo\\rbar\"]}",
  )
  let data = @json.parse("\"foo\\nbar\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g4] enum with escaped characters - member 2 is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [\"foo\\nbar\", \"foo\\rbar\"]}",
  )
  let data = @json.parse("\"foo\\rbar\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g4] enum with escaped characters - another string is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [\"foo\\nbar\", \"foo\\rbar\"]}",
  )
  let data = @json.parse("\"abc\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g5] enum with false does not match 0 - false is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [false]}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g5] enum with false does not match 0 - integer zero is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [false]}",
  )
  let data = @json.parse("0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g5] enum with false does not match 0 - float zero is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [false]}",
  )
  let data = @json.parse("0.0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g6] enum with [false] does not match [0] - [false] is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [[false]]}",
  )
  let data = @json.parse("[false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g6] enum with [false] does not match [0] - [0] is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [[false]]}",
  )
  let data = @json.parse("[0]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g6] enum with [false] does not match [0] - [0.0] is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [[false]]}",
  )
  let data = @json.parse("[0.0]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g7] enum with true does not match 1 - true is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [true]}",
  )
  let data = @json.parse("true")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g7] enum with true does not match 1 - integer one is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [true]}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g7] enum with true does not match 1 - float one is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [true]}",
  )
  let data = @json.parse("1.0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g8] enum with [true] does not match [1] - [true] is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [[true]]}",
  )
  let data = @json.parse("[true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g8] enum with [true] does not match [1] - [1] is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [[true]]}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g8] enum with [true] does not match [1] - [1.0] is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [[true]]}",
  )
  let data = @json.parse("[1.0]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g9] enum with 0 does not match false - false is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [0]}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g9] enum with 0 does not match false - integer zero is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [0]}",
  )
  let data = @json.parse("0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g9] enum with 0 does not match false - float zero is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [0]}",
  )
  let data = @json.parse("0.0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g10] enum with [0] does not match [false] - [false] is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [[0]]}",
  )
  let data = @json.parse("[false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g10] enum with [0] does not match [false] - [0] is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [[0]]}",
  )
  let data = @json.parse("[0]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g10] enum with [0] does not match [false] - [0.0] is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [[0]]}",
  )
  let data = @json.parse("[0.0]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g11] enum with 1 does not match true - true is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [1]}",
  )
  let data = @json.parse("true")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g11] enum with 1 does not match true - integer one is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [1]}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g11] enum with 1 does not match true - float one is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [1]}",
  )
  let data = @json.parse("1.0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g12] enum with [1] does not match [true] - [true] is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [[1]]}",
  )
  let data = @json.parse("[true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g12] enum with [1] does not match [true] - [1] is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [[1]]}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g12] enum with [1] does not match [true] - [1.0] is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [[1]]}",
  )
  let data = @json.parse("[1.0]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g13] nul characters in strings - match string with nul" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [\"hello\\u0000there\"]}",
  )
  let data = @json.parse("\"hello\\u0000there\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g13] nul characters in strings - do not match string lacking nul" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [\"hello\\u0000there\"]}",
  )
  let data = @json.parse("\"hellothere\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g14] empty enum - string is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": []}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g14] empty enum - number is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": []}",
  )
  let data = @json.parse("42")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g14] empty enum - null is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": []}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g14] empty enum - object is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": []}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g14] empty enum - array is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": []}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g14] empty enum - boolean is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": []}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "enum [g15] characters with the same visual representation, but different number of codepoints - character uses the same codepoint" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [\"ä\"], \"$comment\": \"U+00E4\"}",
  )
  let data = @json.parse("\"ä\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "enum [g15] characters with the same visual representation, but different number of codepoints - character looks the same but uses combining marks" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"enum\": [\"ä\"], \"$comment\": \"U+00E4\"}",
  )
  let data = @json.parse("\"ä\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
