// Generated from JSON-Schema-Test-Suite tests/draft2020-12/default.json
// (vendored copy in suite/fixtures/default.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "default [g0] invalid type for default - valid when property is specified" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"integer\", \"default\": []}}}",
  )
  let data = @json.parse("{\"foo\": 13}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "default [g0] invalid type for default - still valid when the invalid default is used" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"integer\", \"default\": []}}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "default [g1] invalid string value for default - valid when property is specified" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"bar\": {\"type\": \"string\", \"minLength\": 4, \"default\": \"bad\"}}}",
  )
  let data = @json.parse("{\"bar\": \"good\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "default [g1] invalid string value for default - still valid when the invalid default is used" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"bar\": {\"type\": \"string\", \"minLength\": 4, \"default\": \"bad\"}}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "default [g2] the default keyword does not do anything if the property is missing - an explicit property value is checked against maximum (passing)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"properties\": {\"alpha\": {\"type\": \"number\", \"maximum\": 3, \"default\": 5}}}",
  )
  let data = @json.parse("{\"alpha\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "default [g2] the default keyword does not do anything if the property is missing - an explicit property value is checked against maximum (failing)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"properties\": {\"alpha\": {\"type\": \"number\", \"maximum\": 3, \"default\": 5}}}",
  )
  let data = @json.parse("{\"alpha\": 5}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "default [g2] the default keyword does not do anything if the property is missing - missing properties are not filled in with the default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"properties\": {\"alpha\": {\"type\": \"number\", \"maximum\": 3, \"default\": 5}}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
