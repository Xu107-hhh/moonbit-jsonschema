// Generated from JSON-Schema-Test-Suite tests/draft2020-12/propertyNames.json
// (vendored copy in suite/fixtures/propertyNames.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "propertyNames [g0] propertyNames validation - all property names valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"maxLength\": 3}}",
  )
  let data = @json.parse("{\"f\": {}, \"foo\": {}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g0] propertyNames validation - some property names invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"maxLength\": 3}}",
  )
  let data = @json.parse("{\"foo\": {}, \"foobar\": {}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "propertyNames [g0] propertyNames validation - object without properties is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"maxLength\": 3}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g0] propertyNames validation - ignores arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"maxLength\": 3}}",
  )
  let data = @json.parse("[1, 2, 3, 4]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g0] propertyNames validation - ignores strings" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"maxLength\": 3}}",
  )
  let data = @json.parse("\"foobar\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g0] propertyNames validation - ignores other non-objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"maxLength\": 3}}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g0] propertyNames validation - ignores null" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"maxLength\": 3}}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g0] propertyNames validation - ignores booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"maxLength\": 3}}",
  )
  let data = @json.parse("true")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g1] propertyNames validation with pattern - matching property names valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"pattern\": \"^a+$\"}}",
  )
  let data = @json.parse("{\"a\": {}, \"aa\": {}, \"aaa\": {}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g1] propertyNames validation with pattern - non-matching property name is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"pattern\": \"^a+$\"}}",
  )
  let data = @json.parse("{\"aaA\": {}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "propertyNames [g1] propertyNames validation with pattern - object without properties is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"pattern\": \"^a+$\"}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g2] propertyNames with boolean schema true - object with any properties is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": true}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g2] propertyNames with boolean schema true - empty object is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": true}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g3] propertyNames with boolean schema false - object with any properties is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": false}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "propertyNames [g3] propertyNames with boolean schema false - empty object is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": false}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g4] propertyNames with const - object with property foo is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"const\": \"foo\"}}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g4] propertyNames with const - object with any other property is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"const\": \"foo\"}}",
  )
  let data = @json.parse("{\"bar\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "propertyNames [g4] propertyNames with const - empty object is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"const\": \"foo\"}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g5] propertyNames with enum - object with property foo is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"enum\": [\"foo\", \"bar\"]}}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g5] propertyNames with enum - object with property foo and bar is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"enum\": [\"foo\", \"bar\"]}}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "propertyNames [g5] propertyNames with enum - object with any other property is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"enum\": [\"foo\", \"bar\"]}}",
  )
  let data = @json.parse("{\"baz\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "propertyNames [g5] propertyNames with enum - empty object is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"enum\": [\"foo\", \"bar\"]}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
