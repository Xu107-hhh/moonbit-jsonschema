// Generated from JSON-Schema-Test-Suite tests/draft2020-12/minProperties.json
// (vendored copy in suite/fixtures/minProperties.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "minProperties [g0] minProperties validation - longer is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minProperties\": 1}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minProperties [g0] minProperties validation - exact length is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minProperties\": 1}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minProperties [g0] minProperties validation - too short is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minProperties\": 1}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minProperties [g0] minProperties validation - ignores arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minProperties\": 1}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minProperties [g0] minProperties validation - ignores strings" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minProperties\": 1}",
  )
  let data = @json.parse("\"\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minProperties [g0] minProperties validation - ignores other non-objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minProperties\": 1}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minProperties [g0] minProperties validation - ignores null" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minProperties\": 1}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minProperties [g0] minProperties validation - ignores booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minProperties\": 1}",
  )
  let data = @json.parse("true")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minProperties [g1] minProperties validation with a decimal - longer is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minProperties\": 1.0}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minProperties [g1] minProperties validation with a decimal - too short is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minProperties\": 1.0}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
