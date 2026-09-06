// Generated from JSON-Schema-Test-Suite tests/draft2020-12/maxProperties.json
// (vendored copy in suite/fixtures/maxProperties.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "maxProperties [g0] maxProperties validation - shorter is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxProperties\": 2}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxProperties [g0] maxProperties validation - exact length is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxProperties\": 2}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxProperties [g0] maxProperties validation - too long is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxProperties\": 2}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2, \"baz\": 3}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "maxProperties [g0] maxProperties validation - ignores arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxProperties\": 2}",
  )
  let data = @json.parse("[1, 2, 3]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxProperties [g0] maxProperties validation - ignores strings" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxProperties\": 2}",
  )
  let data = @json.parse("\"foobar\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxProperties [g0] maxProperties validation - ignores other non-objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxProperties\": 2}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxProperties [g1] maxProperties validation with a decimal - shorter is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxProperties\": 2.0}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxProperties [g1] maxProperties validation with a decimal - too long is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxProperties\": 2.0}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2, \"baz\": 3}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "maxProperties [g2] maxProperties = 0 means the object is empty - no properties is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxProperties\": 0}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxProperties [g2] maxProperties = 0 means the object is empty - one property is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxProperties\": 0}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
