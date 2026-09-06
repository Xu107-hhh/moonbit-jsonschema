// Generated from JSON-Schema-Test-Suite tests/draft2020-12/dependentSchemas.json
// (vendored copy in suite/fixtures/dependentSchemas.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "dependentSchemas [g0] single dependency - valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"bar\": {\"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"type\": \"integer\"}}}}}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentSchemas [g0] single dependency - no dependency" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"bar\": {\"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"type\": \"integer\"}}}}}",
  )
  let data = @json.parse("{\"foo\": \"quux\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentSchemas [g0] single dependency - wrong type" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"bar\": {\"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"type\": \"integer\"}}}}}",
  )
  let data = @json.parse("{\"foo\": \"quux\", \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dependentSchemas [g0] single dependency - wrong type other" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"bar\": {\"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"type\": \"integer\"}}}}}",
  )
  let data = @json.parse("{\"foo\": 2, \"bar\": \"quux\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dependentSchemas [g0] single dependency - wrong type both" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"bar\": {\"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"type\": \"integer\"}}}}}",
  )
  let data = @json.parse("{\"foo\": \"quux\", \"bar\": \"quux\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dependentSchemas [g0] single dependency - ignores arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"bar\": {\"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"type\": \"integer\"}}}}}",
  )
  let data = @json.parse("[\"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentSchemas [g0] single dependency - ignores strings" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"bar\": {\"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"type\": \"integer\"}}}}}",
  )
  let data = @json.parse("\"foobar\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentSchemas [g0] single dependency - ignores other non-objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"bar\": {\"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"type\": \"integer\"}}}}}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentSchemas [g1] boolean subschemas - object with property having schema true is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"foo\": true, \"bar\": false}}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentSchemas [g1] boolean subschemas - object with property having schema false is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"foo\": true, \"bar\": false}}",
  )
  let data = @json.parse("{\"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dependentSchemas [g1] boolean subschemas - object with both properties is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"foo\": true, \"bar\": false}}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dependentSchemas [g1] boolean subschemas - empty object is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"foo\": true, \"bar\": false}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentSchemas [g2] dependencies with escaped characters - quoted tab" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"foo\\tbar\": {\"minProperties\": 4}, \"foo'bar\": {\"required\": [\"foo\\\"bar\"]}}}",
  )
  let data = @json.parse("{\"foo\\tbar\": 1, \"a\": 2, \"b\": 3, \"c\": 4}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentSchemas [g2] dependencies with escaped characters - quoted quote" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"foo\\tbar\": {\"minProperties\": 4}, \"foo'bar\": {\"required\": [\"foo\\\"bar\"]}}}",
  )
  let data = @json.parse("{\"foo'bar\": {\"foo\\\"bar\": 1}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dependentSchemas [g2] dependencies with escaped characters - quoted tab invalid under dependent schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"foo\\tbar\": {\"minProperties\": 4}, \"foo'bar\": {\"required\": [\"foo\\\"bar\"]}}}",
  )
  let data = @json.parse("{\"foo\\tbar\": 1, \"a\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dependentSchemas [g2] dependencies with escaped characters - quoted quote invalid under dependent schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"dependentSchemas\": {\"foo\\tbar\": {\"minProperties\": 4}, \"foo'bar\": {\"required\": [\"foo\\\"bar\"]}}}",
  )
  let data = @json.parse("{\"foo'bar\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dependentSchemas [g3] dependent subschema incompatible with root - matches root" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}}, \"dependentSchemas\": {\"foo\": {\"properties\": {\"bar\": {}}, \"additionalProperties\": false}}}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dependentSchemas [g3] dependent subschema incompatible with root - matches dependency" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}}, \"dependentSchemas\": {\"foo\": {\"properties\": {\"bar\": {}}, \"additionalProperties\": false}}}",
  )
  let data = @json.parse("{\"bar\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "dependentSchemas [g3] dependent subschema incompatible with root - matches both" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}}, \"dependentSchemas\": {\"foo\": {\"properties\": {\"bar\": {}}, \"additionalProperties\": false}}}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "dependentSchemas [g3] dependent subschema incompatible with root - no dependency" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}}, \"dependentSchemas\": {\"foo\": {\"properties\": {\"bar\": {}}, \"additionalProperties\": false}}}",
  )
  let data = @json.parse("{\"baz\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
