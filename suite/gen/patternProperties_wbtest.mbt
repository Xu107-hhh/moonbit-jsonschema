// Generated from JSON-Schema-Test-Suite tests/draft2020-12/patternProperties.json
// (vendored copy in suite/fixtures/patternProperties.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "patternProperties [g0] patternProperties validates properties matching a regex - a single valid match is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"f.*o\": {\"type\": \"integer\"}}}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "patternProperties [g0] patternProperties validates properties matching a regex - multiple valid matches is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"f.*o\": {\"type\": \"integer\"}}}",
  )
  let data = @json.parse("{\"foo\": 1, \"foooooo\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "patternProperties [g0] patternProperties validates properties matching a regex - a single invalid match is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"f.*o\": {\"type\": \"integer\"}}}",
  )
  let data = @json.parse("{\"foo\": \"bar\", \"fooooo\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "patternProperties [g0] patternProperties validates properties matching a regex - multiple invalid matches is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"f.*o\": {\"type\": \"integer\"}}}",
  )
  let data = @json.parse("{\"foo\": \"bar\", \"foooooo\": \"baz\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "patternProperties [g0] patternProperties validates properties matching a regex - ignores arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"f.*o\": {\"type\": \"integer\"}}}",
  )
  let data = @json.parse("[\"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "patternProperties [g0] patternProperties validates properties matching a regex - ignores strings" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"f.*o\": {\"type\": \"integer\"}}}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "patternProperties [g0] patternProperties validates properties matching a regex - ignores other non-objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"f.*o\": {\"type\": \"integer\"}}}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "patternProperties [g1] multiple simultaneous patternProperties are validated - a single valid match is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"a*\": {\"type\": \"integer\"}, \"aaa*\": {\"maximum\": 20}}}",
  )
  let data = @json.parse("{\"a\": 21}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "patternProperties [g1] multiple simultaneous patternProperties are validated - a simultaneous match is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"a*\": {\"type\": \"integer\"}, \"aaa*\": {\"maximum\": 20}}}",
  )
  let data = @json.parse("{\"aaaa\": 18}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "patternProperties [g1] multiple simultaneous patternProperties are validated - multiple matches is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"a*\": {\"type\": \"integer\"}, \"aaa*\": {\"maximum\": 20}}}",
  )
  let data = @json.parse("{\"a\": 21, \"aaaa\": 18}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "patternProperties [g1] multiple simultaneous patternProperties are validated - an invalid due to one is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"a*\": {\"type\": \"integer\"}, \"aaa*\": {\"maximum\": 20}}}",
  )
  let data = @json.parse("{\"a\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "patternProperties [g1] multiple simultaneous patternProperties are validated - an invalid due to the other is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"a*\": {\"type\": \"integer\"}, \"aaa*\": {\"maximum\": 20}}}",
  )
  let data = @json.parse("{\"aaaa\": 31}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "patternProperties [g1] multiple simultaneous patternProperties are validated - an invalid due to both is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"a*\": {\"type\": \"integer\"}, \"aaa*\": {\"maximum\": 20}}}",
  )
  let data = @json.parse("{\"aaa\": \"foo\", \"aaaa\": 31}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "patternProperties [g2] regexes are not anchored by default and are case sensitive - non recognized members are ignored" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"[0-9]{2,}\": {\"type\": \"boolean\"}, \"X_\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"answer 1\": \"42\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "patternProperties [g2] regexes are not anchored by default and are case sensitive - recognized members are accounted for" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"[0-9]{2,}\": {\"type\": \"boolean\"}, \"X_\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"a31b\": null}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "patternProperties [g2] regexes are not anchored by default and are case sensitive - regexes are case sensitive" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"[0-9]{2,}\": {\"type\": \"boolean\"}, \"X_\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"a_x_3\": 3}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "patternProperties [g2] regexes are not anchored by default and are case sensitive - regexes are case sensitive, 2" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"[0-9]{2,}\": {\"type\": \"boolean\"}, \"X_\": {\"type\": \"string\"}}}",
  )
  let data = @json.parse("{\"a_X_3\": 3}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "patternProperties [g3] patternProperties with boolean schemas - object with property matching schema true is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"f.*\": true, \"b.*\": false}}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "patternProperties [g3] patternProperties with boolean schemas - object with property matching schema false is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"f.*\": true, \"b.*\": false}}",
  )
  let data = @json.parse("{\"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "patternProperties [g3] patternProperties with boolean schemas - object with both properties is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"f.*\": true, \"b.*\": false}}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 2}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "patternProperties [g3] patternProperties with boolean schemas - object with a property matching both true and false is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"f.*\": true, \"b.*\": false}}",
  )
  let data = @json.parse("{\"foobar\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "patternProperties [g3] patternProperties with boolean schemas - empty object is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"f.*\": true, \"b.*\": false}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "patternProperties [g4] patternProperties with null valued instance properties - allows null values" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"^.*bar$\": {\"type\": \"null\"}}}",
  )
  let data = @json.parse("{\"foobar\": null}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "patternProperties [g5] patternProperties with Unicode property escape - Unicode letter property name matches" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"patternProperties\": {\"^\\\\p{Letter}+$\": {\"type\": \"number\"}}}",
  )
  let data = @json.parse("{\"π\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "patternProperties [g5] patternProperties with Unicode property escape - Non-letter property name does not match pattern" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"patternProperties\": {\"^\\\\p{Letter}+$\": {\"type\": \"number\"}}}",
  )
  let data = @json.parse("{\"123\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
