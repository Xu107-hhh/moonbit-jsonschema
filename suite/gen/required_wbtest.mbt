// Generated from JSON-Schema-Test-Suite tests/draft2020-12/required.json
// (vendored copy in suite/fixtures/required.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "required [g0] required validation - present required property is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"required\": [\"foo\"]}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "required [g0] required validation - non-present required property is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"required\": [\"foo\"]}",
  )
  let data = @json.parse("{\"bar\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "required [g0] required validation - ignores arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"required\": [\"foo\"]}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "required [g0] required validation - ignores strings" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"required\": [\"foo\"]}",
  )
  let data = @json.parse("\"\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "required [g0] required validation - ignores other non-objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"required\": [\"foo\"]}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "required [g0] required validation - ignores null" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"required\": [\"foo\"]}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "required [g0] required validation - ignores boolean" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"required\": [\"foo\"]}",
  )
  let data = @json.parse("true")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "required [g1] required default validation - not required by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "required [g2] required with empty array - property not required" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}}, \"required\": []}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "required [g3] required with escaped characters - object with all properties present is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"required\": [\"foo\\nbar\", \"foo\\\"bar\", \"foo\\\\bar\", \"foo\\rbar\", \"foo\\tbar\", \"foo\\fbar\"]}",
  )
  let data = @json.parse(
    "{\"foo\\nbar\": 1, \"foo\\\"bar\": 1, \"foo\\\\bar\": 1, \"foo\\rbar\": 1, \"foo\\tbar\": 1, \"foo\\fbar\": 1}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "required [g3] required with escaped characters - object with some properties missing is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"required\": [\"foo\\nbar\", \"foo\\\"bar\", \"foo\\\\bar\", \"foo\\rbar\", \"foo\\tbar\", \"foo\\fbar\"]}",
  )
  let data = @json.parse("{\"foo\\nbar\": \"1\", \"foo\\\"bar\": \"1\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "required [g4] required properties whose names are Javascript object property names - ignores arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"required\": [\"__proto__\", \"toString\", \"constructor\"]}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "required [g4] required properties whose names are Javascript object property names - ignores other non-objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"required\": [\"__proto__\", \"toString\", \"constructor\"]}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "required [g4] required properties whose names are Javascript object property names - none of the properties mentioned" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"required\": [\"__proto__\", \"toString\", \"constructor\"]}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "required [g4] required properties whose names are Javascript object property names - __proto__ present" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"required\": [\"__proto__\", \"toString\", \"constructor\"]}",
  )
  let data = @json.parse("{\"__proto__\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "required [g4] required properties whose names are Javascript object property names - toString present" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"required\": [\"__proto__\", \"toString\", \"constructor\"]}",
  )
  let data = @json.parse("{\"toString\": {\"length\": 37}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "required [g4] required properties whose names are Javascript object property names - constructor present" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"required\": [\"__proto__\", \"toString\", \"constructor\"]}",
  )
  let data = @json.parse("{\"constructor\": {\"length\": 37}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "required [g4] required properties whose names are Javascript object property names - all present" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"required\": [\"__proto__\", \"toString\", \"constructor\"]}",
  )
  let data = @json.parse(
    "{\"__proto__\": 12, \"toString\": {\"length\": \"foo\"}, \"constructor\": 37}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
