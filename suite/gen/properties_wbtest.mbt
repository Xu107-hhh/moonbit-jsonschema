// Generated from JSON-Schema-Test-Suite tests/draft2020-12/properties.json
// (vendored copy in suite/fixtures/properties.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "properties [g0] object properties validation - both properties present and valid is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": \"baz\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "properties [g0] object properties validation - one property invalid is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": {}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "properties [g0] object properties validation - both properties invalid is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"foo\": [], \"bar\": {}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "properties [g0] object properties validation - doesn't invalidate other properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"quux\": []}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "properties [g0] object properties validation - ignores arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "properties [g0] object properties validation - ignores other non-objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"integer\"}, \"bar\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "properties [g1] properties, patternProperties, additionalProperties interaction - property validates property" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"array\", \"maxItems\": 3}, \"bar\": {\"type\": \"array\"}}, \"patternProperties\": {\"f.o\": {\"minItems\": 2}}, \"additionalProperties\": {\"type\": \"integer\"}}",
  )
  let data = @json.parse("{\"foo\": [1, 2]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "properties [g1] properties, patternProperties, additionalProperties interaction - property invalidates property" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"array\", \"maxItems\": 3}, \"bar\": {\"type\": \"array\"}}, \"patternProperties\": {\"f.o\": {\"minItems\": 2}}, \"additionalProperties\": {\"type\": \"integer\"}}",
  )
  let data = @json.parse("{\"foo\": [1, 2, 3, 4]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "properties [g1] properties, patternProperties, additionalProperties interaction - patternProperty invalidates property" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"array\", \"maxItems\": 3}, \"bar\": {\"type\": \"array\"}}, \"patternProperties\": {\"f.o\": {\"minItems\": 2}}, \"additionalProperties\": {\"type\": \"integer\"}}",
  )
  let data = @json.parse("{\"foo\": []}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "properties [g1] properties, patternProperties, additionalProperties interaction - patternProperty validates nonproperty" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"array\", \"maxItems\": 3}, \"bar\": {\"type\": \"array\"}}, \"patternProperties\": {\"f.o\": {\"minItems\": 2}}, \"additionalProperties\": {\"type\": \"integer\"}}",
  )
  let data = @json.parse("{\"fxo\": [1, 2]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "properties [g1] properties, patternProperties, additionalProperties interaction - patternProperty invalidates nonproperty" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"array\", \"maxItems\": 3}, \"bar\": {\"type\": \"array\"}}, \"patternProperties\": {\"f.o\": {\"minItems\": 2}}, \"additionalProperties\": {\"type\": \"integer\"}}",
  )
  let data = @json.parse("{\"fxo\": []}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "properties [g1] properties, patternProperties, additionalProperties interaction - additionalProperty ignores property" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"array\", \"maxItems\": 3}, \"bar\": {\"type\": \"array\"}}, \"patternProperties\": {\"f.o\": {\"minItems\": 2}}, \"additionalProperties\": {\"type\": \"integer\"}}",
  )
  let data = @json.parse("{\"bar\": []}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "properties [g1] properties, patternProperties, additionalProperties interaction - additionalProperty validates others" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"array\", \"maxItems\": 3}, \"bar\": {\"type\": \"array\"}}, \"patternProperties\": {\"f.o\": {\"minItems\": 2}}, \"additionalProperties\": {\"type\": \"integer\"}}",
  )
  let data = @json.parse("{\"quux\": 3}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "properties [g1] properties, patternProperties, additionalProperties interaction - additionalProperty invalidates others" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"array\", \"maxItems\": 3}, \"bar\": {\"type\": \"array\"}}, \"patternProperties\": {\"f.o\": {\"minItems\": 2}}, \"additionalProperties\": {\"type\": \"integer\"}}",
  )
  let data = @json.parse("{\"quux\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "properties [g2] properties with boolean schema - no property present is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": true, \"bar\": false}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "properties [g2] properties with boolean schema - only 'true' property present is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": true, \"bar\": false}}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "properties [g2] properties with boolean schema - only 'false' property present is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": true, \"bar\": false}}",
  )
  let data = @json.parse("{\"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "properties [g2] properties with boolean schema - both properties present is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": true, \"bar\": false}}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "properties [g3] properties with escaped characters - object with all numbers is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\\nbar\": {\"type\": \"number\"}, \"foo\\\"bar\": {\"type\": \"number\"}, \"foo\\\\bar\": {\"type\": \"number\"}, \"foo\\rbar\": {\"type\": \"number\"}, \"foo\\tbar\": {\"type\": \"number\"}, \"foo\\fbar\": {\"type\": \"number\"}}}",
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
test "properties [g3] properties with escaped characters - object with strings is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\\nbar\": {\"type\": \"number\"}, \"foo\\\"bar\": {\"type\": \"number\"}, \"foo\\\\bar\": {\"type\": \"number\"}, \"foo\\rbar\": {\"type\": \"number\"}, \"foo\\tbar\": {\"type\": \"number\"}, \"foo\\fbar\": {\"type\": \"number\"}}}",
  )
  let data = @json.parse(
    "{\"foo\\nbar\": \"1\", \"foo\\\"bar\": \"1\", \"foo\\\\bar\": \"1\", \"foo\\rbar\": \"1\", \"foo\\tbar\": \"1\", \"foo\\fbar\": \"1\"}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "properties [g4] properties with null valued instance properties - allows null values" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"null\"}}}",
  )
  let data = @json.parse("{\"foo\": null}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "properties [g5] properties whose names are Javascript object property names - ignores arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"__proto__\": {\"type\": \"number\"}, \"toString\": {\"properties\": {\"length\": {\"type\": \"string\"}}}, \"constructor\": {\"type\": \"number\"}}}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "properties [g5] properties whose names are Javascript object property names - ignores other non-objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"__proto__\": {\"type\": \"number\"}, \"toString\": {\"properties\": {\"length\": {\"type\": \"string\"}}}, \"constructor\": {\"type\": \"number\"}}}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "properties [g5] properties whose names are Javascript object property names - none of the properties mentioned" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"__proto__\": {\"type\": \"number\"}, \"toString\": {\"properties\": {\"length\": {\"type\": \"string\"}}}, \"constructor\": {\"type\": \"number\"}}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "properties [g5] properties whose names are Javascript object property names - __proto__ not valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"__proto__\": {\"type\": \"number\"}, \"toString\": {\"properties\": {\"length\": {\"type\": \"string\"}}}, \"constructor\": {\"type\": \"number\"}}}",
  )
  let data = @json.parse("{\"__proto__\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "properties [g5] properties whose names are Javascript object property names - toString not valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"__proto__\": {\"type\": \"number\"}, \"toString\": {\"properties\": {\"length\": {\"type\": \"string\"}}}, \"constructor\": {\"type\": \"number\"}}}",
  )
  let data = @json.parse("{\"toString\": {\"length\": 37}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "properties [g5] properties whose names are Javascript object property names - constructor not valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"__proto__\": {\"type\": \"number\"}, \"toString\": {\"properties\": {\"length\": {\"type\": \"string\"}}}, \"constructor\": {\"type\": \"number\"}}}",
  )
  let data = @json.parse("{\"constructor\": {\"length\": 37}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "properties [g5] properties whose names are Javascript object property names - all present and valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"__proto__\": {\"type\": \"number\"}, \"toString\": {\"properties\": {\"length\": {\"type\": \"string\"}}}, \"constructor\": {\"type\": \"number\"}}}",
  )
  let data = @json.parse(
    "{\"__proto__\": 12, \"toString\": {\"length\": \"foo\"}, \"constructor\": 37}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
