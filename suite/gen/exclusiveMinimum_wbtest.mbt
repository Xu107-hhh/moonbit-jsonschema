// Generated from JSON-Schema-Test-Suite tests/draft2020-12/exclusiveMinimum.json
// (vendored copy in suite/fixtures/exclusiveMinimum.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "exclusiveMinimum [g0] exclusiveMinimum validation - above the exclusiveMinimum is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"exclusiveMinimum\": 1.1}",
  )
  let data = @json.parse("1.2")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "exclusiveMinimum [g0] exclusiveMinimum validation - boundary point is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"exclusiveMinimum\": 1.1}",
  )
  let data = @json.parse("1.1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "exclusiveMinimum [g0] exclusiveMinimum validation - below the exclusiveMinimum is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"exclusiveMinimum\": 1.1}",
  )
  let data = @json.parse("0.6")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "exclusiveMinimum [g0] exclusiveMinimum validation - ignores non-numbers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"exclusiveMinimum\": 1.1}",
  )
  let data = @json.parse("\"x\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
