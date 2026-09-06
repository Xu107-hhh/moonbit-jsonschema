// Generated from JSON-Schema-Test-Suite tests/draft2020-12/oneOf.json
// (vendored copy in suite/fixtures/oneOf.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "oneOf [g0] oneOf - first oneOf valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"type\": \"integer\"}, {\"minimum\": 2}]}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "oneOf [g0] oneOf - second oneOf valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"type\": \"integer\"}, {\"minimum\": 2}]}",
  )
  let data = @json.parse("2.5")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "oneOf [g0] oneOf - both oneOf valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"type\": \"integer\"}, {\"minimum\": 2}]}",
  )
  let data = @json.parse("3")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "oneOf [g0] oneOf - neither oneOf valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"type\": \"integer\"}, {\"minimum\": 2}]}",
  )
  let data = @json.parse("1.5")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "oneOf [g1] oneOf with base schema - mismatch base schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"string\", \"oneOf\": [{\"minLength\": 2}, {\"maxLength\": 4}]}",
  )
  let data = @json.parse("3")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "oneOf [g1] oneOf with base schema - one oneOf valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"string\", \"oneOf\": [{\"minLength\": 2}, {\"maxLength\": 4}]}",
  )
  let data = @json.parse("\"foobar\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "oneOf [g1] oneOf with base schema - both oneOf valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"string\", \"oneOf\": [{\"minLength\": 2}, {\"maxLength\": 4}]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "oneOf [g2] oneOf with boolean schemas, all true - any value is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [true, true, true]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "oneOf [g3] oneOf with boolean schemas, one true - any value is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [true, false, false]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "oneOf [g4] oneOf with boolean schemas, more than one true - any value is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [true, true, false]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "oneOf [g5] oneOf with boolean schemas, all false - any value is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [false, false, false]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "oneOf [g6] oneOf complex types - first oneOf valid (complex)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "oneOf [g6] oneOf complex types - second oneOf valid (complex)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"foo\": \"baz\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "oneOf [g6] oneOf complex types - both oneOf valid (complex)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"foo\": \"baz\", \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "oneOf [g6] oneOf complex types - neither oneOf valid (complex)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"properties\": {\"bar\": {\"type\": \"integer\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": {\"type\": \"string\"}}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"foo\": 2, \"bar\": \"quux\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "oneOf [g7] oneOf with empty schema - one valid - valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"type\": \"number\"}, {}]}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "oneOf [g7] oneOf with empty schema - both valid - invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"type\": \"number\"}, {}]}",
  )
  let data = @json.parse("123")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "oneOf [g8] oneOf with required - both invalid - invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"oneOf\": [{\"required\": [\"foo\", \"bar\"]}, {\"required\": [\"foo\", \"baz\"]}]}",
  )
  let data = @json.parse("{\"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "oneOf [g8] oneOf with required - first valid - valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"oneOf\": [{\"required\": [\"foo\", \"bar\"]}, {\"required\": [\"foo\", \"baz\"]}]}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "oneOf [g8] oneOf with required - second valid - valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"oneOf\": [{\"required\": [\"foo\", \"bar\"]}, {\"required\": [\"foo\", \"baz\"]}]}",
  )
  let data = @json.parse("{\"foo\": 1, \"baz\": 3}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "oneOf [g8] oneOf with required - both valid - invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"oneOf\": [{\"required\": [\"foo\", \"bar\"]}, {\"required\": [\"foo\", \"baz\"]}]}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2, \"baz\": 3}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "oneOf [g9] oneOf with missing optional property - first oneOf valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"properties\": {\"bar\": true, \"baz\": true}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": true}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"bar\": 8}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "oneOf [g9] oneOf with missing optional property - second oneOf valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"properties\": {\"bar\": true, \"baz\": true}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": true}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "oneOf [g9] oneOf with missing optional property - both oneOf valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"properties\": {\"bar\": true, \"baz\": true}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": true}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": 8}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "oneOf [g9] oneOf with missing optional property - neither oneOf valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"properties\": {\"bar\": true, \"baz\": true}, \"required\": [\"bar\"]}, {\"properties\": {\"foo\": true}, \"required\": [\"foo\"]}]}",
  )
  let data = @json.parse("{\"baz\": \"quux\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "oneOf [g10] nested oneOf, to check validation semantics - null is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"oneOf\": [{\"type\": \"null\"}]}]}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "oneOf [g10] nested oneOf, to check validation semantics - anything non-null is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"oneOf\": [{\"oneOf\": [{\"type\": \"null\"}]}]}",
  )
  let data = @json.parse("123")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
