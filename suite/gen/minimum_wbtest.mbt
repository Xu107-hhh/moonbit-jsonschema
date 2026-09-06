// Generated from JSON-Schema-Test-Suite tests/draft2020-12/minimum.json
// (vendored copy in suite/fixtures/minimum.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "minimum [g0] minimum validation - above the minimum is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minimum\": 1.1}",
  )
  let data = @json.parse("2.6")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minimum [g0] minimum validation - boundary point is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minimum\": 1.1}",
  )
  let data = @json.parse("1.1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minimum [g0] minimum validation - below the minimum is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minimum\": 1.1}",
  )
  let data = @json.parse("0.6")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minimum [g0] minimum validation - ignores non-numbers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minimum\": 1.1}",
  )
  let data = @json.parse("\"x\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minimum [g1] minimum validation with signed integer - negative above the minimum is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minimum\": -2}",
  )
  let data = @json.parse("-1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minimum [g1] minimum validation with signed integer - positive above the minimum is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minimum\": -2}",
  )
  let data = @json.parse("0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minimum [g1] minimum validation with signed integer - boundary point is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minimum\": -2}",
  )
  let data = @json.parse("-2")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minimum [g1] minimum validation with signed integer - boundary point with float is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minimum\": -2}",
  )
  let data = @json.parse("-2.0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minimum [g1] minimum validation with signed integer - float below the minimum is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minimum\": -2}",
  )
  let data = @json.parse("-2.0001")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minimum [g1] minimum validation with signed integer - int below the minimum is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minimum\": -2}",
  )
  let data = @json.parse("-3")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minimum [g1] minimum validation with signed integer - ignores non-numbers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minimum\": -2}",
  )
  let data = @json.parse("\"x\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
