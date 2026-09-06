// Generated from JSON-Schema-Test-Suite tests/draft2020-12/boolean_schema.json
// (vendored copy in suite/fixtures/boolean_schema.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "boolean_schema [g0] boolean schema 'true' - number is valid" {
  let schema = @json.parse("true")
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "boolean_schema [g0] boolean schema 'true' - string is valid" {
  let schema = @json.parse("true")
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "boolean_schema [g0] boolean schema 'true' - boolean true is valid" {
  let schema = @json.parse("true")
  let data = @json.parse("true")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "boolean_schema [g0] boolean schema 'true' - boolean false is valid" {
  let schema = @json.parse("true")
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "boolean_schema [g0] boolean schema 'true' - null is valid" {
  let schema = @json.parse("true")
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "boolean_schema [g0] boolean schema 'true' - object is valid" {
  let schema = @json.parse("true")
  let data = @json.parse("{\"foo\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "boolean_schema [g0] boolean schema 'true' - empty object is valid" {
  let schema = @json.parse("true")
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "boolean_schema [g0] boolean schema 'true' - array is valid" {
  let schema = @json.parse("true")
  let data = @json.parse("[\"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "boolean_schema [g0] boolean schema 'true' - empty array is valid" {
  let schema = @json.parse("true")
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "boolean_schema [g1] boolean schema 'false' - number is invalid" {
  let schema = @json.parse("false")
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "boolean_schema [g1] boolean schema 'false' - string is invalid" {
  let schema = @json.parse("false")
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "boolean_schema [g1] boolean schema 'false' - boolean true is invalid" {
  let schema = @json.parse("false")
  let data = @json.parse("true")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "boolean_schema [g1] boolean schema 'false' - boolean false is invalid" {
  let schema = @json.parse("false")
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "boolean_schema [g1] boolean schema 'false' - null is invalid" {
  let schema = @json.parse("false")
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "boolean_schema [g1] boolean schema 'false' - object is invalid" {
  let schema = @json.parse("false")
  let data = @json.parse("{\"foo\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "boolean_schema [g1] boolean schema 'false' - empty object is invalid" {
  let schema = @json.parse("false")
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "boolean_schema [g1] boolean schema 'false' - array is invalid" {
  let schema = @json.parse("false")
  let data = @json.parse("[\"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "boolean_schema [g1] boolean schema 'false' - empty array is invalid" {
  let schema = @json.parse("false")
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
