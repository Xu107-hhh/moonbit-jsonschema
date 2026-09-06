// Generated from JSON-Schema-Test-Suite tests/draft2020-12/maxLength.json
// (vendored copy in suite/fixtures/maxLength.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "maxLength [g0] maxLength validation - shorter is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxLength\": 2}",
  )
  let data = @json.parse("\"f\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxLength [g0] maxLength validation - exact length is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxLength\": 2}",
  )
  let data = @json.parse("\"fo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxLength [g0] maxLength validation - too long is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxLength\": 2}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "maxLength [g0] maxLength validation - ignores non-strings" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxLength\": 2}",
  )
  let data = @json.parse("100")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxLength [g0] maxLength validation - two graphemes is long enough" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxLength\": 2}",
  )
  let data = @json.parse("\"💩💩\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxLength [g1] maxLength validation with a decimal - shorter is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxLength\": 2.0}",
  )
  let data = @json.parse("\"f\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxLength [g1] maxLength validation with a decimal - too long is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxLength\": 2.0}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
