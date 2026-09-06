// Generated from JSON-Schema-Test-Suite tests/draft2020-12/dependentRequired.json
// (vendored copy in suite/fixtures/dependentRequired.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "dependentRequired [g0] single dependency - neither" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"bar\": [\"foo\"]}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentRequired [g0] single dependency - nondependant" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"bar\": [\"foo\"]}}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentRequired [g0] single dependency - with dependency" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"bar\": [\"foo\"]}}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentRequired [g0] single dependency - missing dependency" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"bar\": [\"foo\"]}}",
  )
  let data = @json.parse("{\"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dependentRequired [g0] single dependency - ignores arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"bar\": [\"foo\"]}}",
  )
  let data = @json.parse("[\"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentRequired [g0] single dependency - ignores strings" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"bar\": [\"foo\"]}}",
  )
  let data = @json.parse("\"foobar\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentRequired [g0] single dependency - ignores other non-objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"bar\": [\"foo\"]}}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentRequired [g1] empty dependents - empty object" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"bar\": []}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentRequired [g1] empty dependents - object with one property" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"bar\": []}}",
  )
  let data = @json.parse("{\"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentRequired [g1] empty dependents - non-object is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"bar\": []}}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentRequired [g2] multiple dependents required - neither" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"quux\": [\"foo\", \"bar\"]}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentRequired [g2] multiple dependents required - nondependants" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"quux\": [\"foo\", \"bar\"]}}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentRequired [g2] multiple dependents required - with dependencies" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"quux\": [\"foo\", \"bar\"]}}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2, \"quux\": 3}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentRequired [g2] multiple dependents required - missing dependency" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"quux\": [\"foo\", \"bar\"]}}",
  )
  let data = @json.parse("{\"foo\": 1, \"quux\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dependentRequired [g2] multiple dependents required - missing other dependency" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"quux\": [\"foo\", \"bar\"]}}",
  )
  let data = @json.parse("{\"bar\": 1, \"quux\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dependentRequired [g2] multiple dependents required - missing both dependencies" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"quux\": [\"foo\", \"bar\"]}}",
  )
  let data = @json.parse("{\"quux\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dependentRequired [g3] dependencies with escaped characters - CRLF" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"foo\\nbar\": [\"foo\\rbar\"], \"foo\\\"bar\": [\"foo'bar\"]}}",
  )
  let data = @json.parse("{\"foo\\nbar\": 1, \"foo\\rbar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentRequired [g3] dependencies with escaped characters - quoted quotes" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"foo\\nbar\": [\"foo\\rbar\"], \"foo\\\"bar\": [\"foo'bar\"]}}",
  )
  let data = @json.parse("{\"foo'bar\": 1, \"foo\\\"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentRequired [g3] dependencies with escaped characters - CRLF missing dependent" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"foo\\nbar\": [\"foo\\rbar\"], \"foo\\\"bar\": [\"foo'bar\"]}}",
  )
  let data = @json.parse("{\"foo\\nbar\": 1, \"foo\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dependentRequired [g3] dependencies with escaped characters - quoted quotes missing dependent" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentRequired\": {\"foo\\nbar\": [\"foo\\rbar\"], \"foo\\\"bar\": [\"foo'bar\"]}}",
  )
  let data = @json.parse("{\"foo\\\"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
