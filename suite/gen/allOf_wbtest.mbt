// Generated from JSON-Schema-Test-Suite tests/draft2020-12/allOf.json
// (vendored copy in suite/fixtures/allOf.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "allOf [g0] allOf - allOf" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"foo\": \"baz\", \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "allOf [g0] allOf - mismatch second" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"foo\": \"baz\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g0] allOf - mismatch first" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g0] allOf - wrong type" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"foo\": \"baz\", \"bar\": \"quux\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g1] allOf with base schema - valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"], \"allOf\": [{\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}, {\"properties\": {\"baz\": {\"type\": \"null\"}}, \"required\": [\"baz\"]}]}",
  )
  let data = @json.parse("{\"foo\": \"quux\", \"bar\": 2, \"baz\": null}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "allOf [g1] allOf with base schema - mismatch base schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"], \"allOf\": [{\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}, {\"properties\": {\"baz\": {\"type\": \"null\"}}, \"required\": [\"baz\"]}]}",
  )
  let data = @json.parse("{\"foo\": \"quux\", \"baz\": null}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g1] allOf with base schema - mismatch first allOf" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"], \"allOf\": [{\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}, {\"properties\": {\"baz\": {\"type\": \"null\"}}, \"required\": [\"baz\"]}]}",
  )
  let data = @json.parse("{\"bar\": 2, \"baz\": null}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g1] allOf with base schema - mismatch second allOf" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"], \"allOf\": [{\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}, {\"properties\": {\"baz\": {\"type\": \"null\"}}, \"required\": [\"baz\"]}]}",
  )
  let data = @json.parse("{\"foo\": \"quux\", \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g1] allOf with base schema - mismatch both" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"], \"allOf\": [{\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}, {\"properties\": {\"baz\": {\"type\": \"null\"}}, \"required\": [\"baz\"]}]}",
  )
  let data = @json.parse("{\"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g2] allOf simple types - valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"maximum\": 30}, {\"minimum\": 20}]}",
  )
  let data = @json.parse("25")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "allOf [g2] allOf simple types - mismatch one" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"maximum\": 30}, {\"minimum\": 20}]}",
  )
  let data = @json.parse("35")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g3] allOf with boolean schemas, all true - any value is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [true, true]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "allOf [g4] allOf with boolean schemas, some false - any value is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [true, false]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g5] allOf with boolean schemas, all false - any value is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [false, false]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g6] allOf with one empty schema - any data is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{}]}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "allOf [g7] allOf with two empty schemas - any data is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{}, {}]}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "allOf [g8] allOf with the first empty schema - number is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{}, {\"type\": \"number\"}]}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "allOf [g8] allOf with the first empty schema - string is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{}, {\"type\": \"number\"}]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g9] allOf with the last empty schema - number is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"type\": \"number\"}, {}]}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "allOf [g9] allOf with the last empty schema - string is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"type\": \"number\"}, {}]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g10] nested allOf, to check validation semantics - null is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"allOf\": [{\"type\": \"null\"}]}]}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "allOf [g10] nested allOf, to check validation semantics - anything non-null is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"allOf\": [{\"type\": \"null\"}]}]}",
  )
  let data = @json.parse("123")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g11] allOf combined with anyOf, oneOf - allOf: false, anyOf: false, oneOf: false" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"multipleOf\": 2}], \"anyOf\": [{\"multipleOf\": 3}], \"oneOf\": [{\"multipleOf\": 5}]}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g11] allOf combined with anyOf, oneOf - allOf: false, anyOf: false, oneOf: true" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"multipleOf\": 2}], \"anyOf\": [{\"multipleOf\": 3}], \"oneOf\": [{\"multipleOf\": 5}]}",
  )
  let data = @json.parse("5")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g11] allOf combined with anyOf, oneOf - allOf: false, anyOf: true, oneOf: false" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"multipleOf\": 2}], \"anyOf\": [{\"multipleOf\": 3}], \"oneOf\": [{\"multipleOf\": 5}]}",
  )
  let data = @json.parse("3")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g11] allOf combined with anyOf, oneOf - allOf: false, anyOf: true, oneOf: true" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"multipleOf\": 2}], \"anyOf\": [{\"multipleOf\": 3}], \"oneOf\": [{\"multipleOf\": 5}]}",
  )
  let data = @json.parse("15")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g11] allOf combined with anyOf, oneOf - allOf: true, anyOf: false, oneOf: false" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"multipleOf\": 2}], \"anyOf\": [{\"multipleOf\": 3}], \"oneOf\": [{\"multipleOf\": 5}]}",
  )
  let data = @json.parse("2")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g11] allOf combined with anyOf, oneOf - allOf: true, anyOf: false, oneOf: true" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"multipleOf\": 2}], \"anyOf\": [{\"multipleOf\": 3}], \"oneOf\": [{\"multipleOf\": 5}]}",
  )
  let data = @json.parse("10")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g11] allOf combined with anyOf, oneOf - allOf: true, anyOf: true, oneOf: false" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"multipleOf\": 2}], \"anyOf\": [{\"multipleOf\": 3}], \"oneOf\": [{\"multipleOf\": 5}]}",
  )
  let data = @json.parse("6")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "allOf [g11] allOf combined with anyOf, oneOf - allOf: true, anyOf: true, oneOf: true" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"multipleOf\": 2}], \"anyOf\": [{\"multipleOf\": 3}], \"oneOf\": [{\"multipleOf\": 5}]}",
  )
  let data = @json.parse("30")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
