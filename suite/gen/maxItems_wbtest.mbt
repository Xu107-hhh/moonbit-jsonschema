// Generated from JSON-Schema-Test-Suite tests/draft2020-12/maxItems.json
// (vendored copy in suite/fixtures/maxItems.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "maxItems [g0] maxItems validation - shorter is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxItems\": 2}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxItems [g0] maxItems validation - exact length is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxItems\": 2}",
  )
  let data = @json.parse("[1, 2]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxItems [g0] maxItems validation - too long is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxItems\": 2}",
  )
  let data = @json.parse("[1, 2, 3]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "maxItems [g0] maxItems validation - ignores non-arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxItems\": 2}",
  )
  let data = @json.parse("\"foobar\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxItems [g1] maxItems validation with a decimal - shorter is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxItems\": 2.0}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxItems [g1] maxItems validation with a decimal - too long is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxItems\": 2.0}",
  )
  let data = @json.parse("[1, 2, 3]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
