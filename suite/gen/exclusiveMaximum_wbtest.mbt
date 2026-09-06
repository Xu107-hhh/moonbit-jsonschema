// Generated from JSON-Schema-Test-Suite tests/draft2020-12/exclusiveMaximum.json
// (vendored copy in suite/fixtures/exclusiveMaximum.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "exclusiveMaximum [g0] exclusiveMaximum validation - below the exclusiveMaximum is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"exclusiveMaximum\": 3.0}",
  )
  let data = @json.parse("2.2")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "exclusiveMaximum [g0] exclusiveMaximum validation - boundary point is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"exclusiveMaximum\": 3.0}",
  )
  let data = @json.parse("3.0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "exclusiveMaximum [g0] exclusiveMaximum validation - above the exclusiveMaximum is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"exclusiveMaximum\": 3.0}",
  )
  let data = @json.parse("3.5")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "exclusiveMaximum [g0] exclusiveMaximum validation - ignores non-numbers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"exclusiveMaximum\": 3.0}",
  )
  let data = @json.parse("\"x\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
