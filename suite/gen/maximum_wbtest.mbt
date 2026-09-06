// Generated from JSON-Schema-Test-Suite tests/draft2020-12/maximum.json
// (vendored copy in suite/fixtures/maximum.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "maximum [g0] maximum validation - below the maximum is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maximum\": 3.0}",
  )
  let data = @json.parse("2.6")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maximum [g0] maximum validation - boundary point is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maximum\": 3.0}",
  )
  let data = @json.parse("3.0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maximum [g0] maximum validation - above the maximum is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maximum\": 3.0}",
  )
  let data = @json.parse("3.5")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "maximum [g0] maximum validation - ignores non-numbers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maximum\": 3.0}",
  )
  let data = @json.parse("\"x\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maximum [g1] maximum validation with unsigned integer - below the maximum is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maximum\": 300}",
  )
  let data = @json.parse("299.97")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maximum [g1] maximum validation with unsigned integer - boundary point integer is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maximum\": 300}",
  )
  let data = @json.parse("300")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maximum [g1] maximum validation with unsigned integer - boundary point float is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maximum\": 300}",
  )
  let data = @json.parse("300.0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maximum [g1] maximum validation with unsigned integer - above the maximum is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maximum\": 300}",
  )
  let data = @json.parse("300.5")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
