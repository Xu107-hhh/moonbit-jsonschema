// Generated from JSON-Schema-Test-Suite tests/draft2020-12/additionalProperties.json
// (vendored copy in suite/fixtures/additionalProperties.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "additionalProperties [g0] additionalProperties being false does not allow other properties - no additional properties is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"patternProperties\": {\"^v\": {}}, \"additionalProperties\": false}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "additionalProperties [g0] additionalProperties being false does not allow other properties - an additional property is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"patternProperties\": {\"^v\": {}}, \"additionalProperties\": false}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2, \"quux\": \"boom\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "additionalProperties [g0] additionalProperties being false does not allow other properties - ignores arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"patternProperties\": {\"^v\": {}}, \"additionalProperties\": false}",
  )
  let data = @json.parse("[1, 2, 3]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "additionalProperties [g0] additionalProperties being false does not allow other properties - ignores strings" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"patternProperties\": {\"^v\": {}}, \"additionalProperties\": false}",
  )
  let data = @json.parse("\"foobarbaz\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "additionalProperties [g0] additionalProperties being false does not allow other properties - ignores other non-objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"patternProperties\": {\"^v\": {}}, \"additionalProperties\": false}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "additionalProperties [g0] additionalProperties being false does not allow other properties - patternProperties are not additional properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"patternProperties\": {\"^v\": {}}, \"additionalProperties\": false}",
  )
  let data = @json.parse("{\"foo\": 1, \"vroom\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "additionalProperties [g1] non-ASCII pattern with additionalProperties - matching the pattern is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"^á\": {}}, \"additionalProperties\": false}",
  )
  let data = @json.parse("{\"ármányos\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "additionalProperties [g1] non-ASCII pattern with additionalProperties - not matching the pattern is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"^á\": {}}, \"additionalProperties\": false}",
  )
  let data = @json.parse("{\"élmény\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "additionalProperties [g2] additionalProperties with schema - no additional properties is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"additionalProperties\": {\"type\": \"boolean\"}}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "additionalProperties [g2] additionalProperties with schema - an additional valid property is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"additionalProperties\": {\"type\": \"boolean\"}}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2, \"quux\": true}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "additionalProperties [g2] additionalProperties with schema - an additional invalid property is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}, \"additionalProperties\": {\"type\": \"boolean\"}}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2, \"quux\": 12}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "additionalProperties [g3] additionalProperties can exist by itself - an additional valid property is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"additionalProperties\": {\"type\": \"boolean\"}}",
  )
  let data = @json.parse("{\"foo\": true}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "additionalProperties [g3] additionalProperties can exist by itself - an additional invalid property is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"additionalProperties\": {\"type\": \"boolean\"}}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "additionalProperties [g4] additionalProperties are allowed by default - additional properties are allowed" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {}, \"bar\": {}}}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2, \"quux\": true}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "additionalProperties [g5] additionalProperties does not look in applicators - properties defined in allOf are not examined" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"foo\": {}}}], \"additionalProperties\": {\"type\": \"boolean\"}}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": true}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "additionalProperties [g6] additionalProperties with null valued instance properties - allows null values" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"additionalProperties\": {\"type\": \"null\"}}",
  )
  let data = @json.parse("{\"foo\": null}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "additionalProperties [g7] additionalProperties with propertyNames - Valid against both keywords" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"maxLength\": 5}, \"additionalProperties\": {\"type\": \"number\"}}",
  )
  let data = @json.parse("{\"apple\": 4}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "additionalProperties [g7] additionalProperties with propertyNames - Valid against propertyNames, but not additionalProperties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"maxLength\": 5}, \"additionalProperties\": {\"type\": \"number\"}}",
  )
  let data = @json.parse("{\"fig\": 2, \"pear\": \"available\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "additionalProperties [g8] dependentSchemas with additionalProperties - additionalProperties doesn't consider dependentSchemas" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo2\": {}}, \"dependentSchemas\": {\"foo\": {}, \"foo2\": {\"properties\": {\"bar\": {}}}}, \"additionalProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "additionalProperties [g8] dependentSchemas with additionalProperties - additionalProperties can't see bar" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo2\": {}}, \"dependentSchemas\": {\"foo\": {}, \"foo2\": {\"properties\": {\"bar\": {}}}}, \"additionalProperties\": false}",
  )
  let data = @json.parse("{\"bar\": \"\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "additionalProperties [g8] dependentSchemas with additionalProperties - additionalProperties can't see bar even when foo2 is present" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo2\": {}}, \"dependentSchemas\": {\"foo\": {}, \"foo2\": {\"properties\": {\"bar\": {}}}}, \"additionalProperties\": false}",
  )
  let data = @json.parse("{\"foo2\": \"\", \"bar\": \"\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
