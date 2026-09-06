// Generated from JSON-Schema-Test-Suite tests/draft2020-12/anyOf.json
// (vendored copy in suite/fixtures/anyOf.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "anyOf [g0] anyOf - first anyOf valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"anyOf\": [{\"type\": \"integer\"}, {\"minimum\": 2}]}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anyOf [g0] anyOf - second anyOf valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"anyOf\": [{\"type\": \"integer\"}, {\"minimum\": 2}]}",
  )
  let data = @json.parse("2.5")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anyOf [g0] anyOf - both anyOf valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"anyOf\": [{\"type\": \"integer\"}, {\"minimum\": 2}]}",
  )
  let data = @json.parse("3")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anyOf [g0] anyOf - neither anyOf valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"anyOf\": [{\"type\": \"integer\"}, {\"minimum\": 2}]}",
  )
  let data = @json.parse("1.5")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "anyOf [g1] anyOf with base schema - mismatch base schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"string\", \"anyOf\": [{\"maxLength\": 2}, {\"minLength\": 4}]}",
  )
  let data = @json.parse("3")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "anyOf [g1] anyOf with base schema - one anyOf valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"string\", \"anyOf\": [{\"maxLength\": 2}, {\"minLength\": 4}]}",
  )
  let data = @json.parse("\"foobar\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anyOf [g1] anyOf with base schema - both anyOf invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"string\", \"anyOf\": [{\"maxLength\": 2}, {\"minLength\": 4}]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "anyOf [g2] anyOf with boolean schemas, all true - any value is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"anyOf\": [true, true]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anyOf [g3] anyOf with boolean schemas, some true - any value is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"anyOf\": [true, false]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anyOf [g4] anyOf with boolean schemas, all false - any value is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"anyOf\": [false, false]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "anyOf [g5] anyOf complex types - first anyOf valid (complex)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"anyOf\": [{\"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anyOf [g5] anyOf complex types - second anyOf valid (complex)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"anyOf\": [{\"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"foo\": \"baz\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anyOf [g5] anyOf complex types - both anyOf valid (complex)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"anyOf\": [{\"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"foo\": \"baz\", \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anyOf [g5] anyOf complex types - neither anyOf valid (complex)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"anyOf\": [{\"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"foo\": 2, \"bar\": \"quux\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "anyOf [g6] anyOf with one empty schema - string is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"anyOf\": [{\"type\": \"number\"}, {}]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anyOf [g6] anyOf with one empty schema - number is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"anyOf\": [{\"type\": \"number\"}, {}]}",
  )
  let data = @json.parse("123")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anyOf [g7] nested anyOf, to check validation semantics - null is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"anyOf\": [{\"anyOf\": [{\"type\": \"null\"}]}]}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anyOf [g7] nested anyOf, to check validation semantics - anything non-null is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"anyOf\": [{\"anyOf\": [{\"type\": \"null\"}]}]}",
  )
  let data = @json.parse("123")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
