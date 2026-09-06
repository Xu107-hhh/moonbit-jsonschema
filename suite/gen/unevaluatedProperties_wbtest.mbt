// Generated from JSON-Schema-Test-Suite tests/draft2020-12/unevaluatedProperties.json
// (vendored copy in suite/fixtures/unevaluatedProperties.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "unevaluatedProperties [g0] unevaluatedProperties true - with no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": true}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g0] unevaluatedProperties true - with unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": true}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g1] unevaluatedProperties schema - with no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": {\"type\": \"string\", \"minLength\": 3}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g1] unevaluatedProperties schema - with valid unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": {\"type\": \"string\", \"minLength\": 3}}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g1] unevaluatedProperties schema - with invalid unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": {\"type\": \"string\", \"minLength\": 3}}",
  )
  let data = @json.parse("{\"foo\": \"fo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g2] unevaluatedProperties false - with no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g2] unevaluatedProperties false - with unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g3] unevaluatedProperties with adjacent properties - with no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g3] unevaluatedProperties with adjacent properties - with unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g4] unevaluatedProperties with adjacent patternProperties - with no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"^foo\": {\"type\": \"string\"}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g4] unevaluatedProperties with adjacent patternProperties - with unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"patternProperties\": {\"^foo\": {\"type\": \"string\"}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g5] unevaluatedProperties with adjacent bool additionalProperties - with no additional properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"additionalProperties\": true, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g5] unevaluatedProperties with adjacent bool additionalProperties - with additional properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"additionalProperties\": true, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g6] unevaluatedProperties with adjacent non-bool additionalProperties - with no additional properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"additionalProperties\": {\"type\": \"string\"}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g6] unevaluatedProperties with adjacent non-bool additionalProperties - with additional properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"additionalProperties\": {\"type\": \"string\"}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g7] unevaluatedProperties with nested properties - with no additional properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"allOf\": [{\"properties\": {\"bar\": {\"type\": \"string\"}}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g7] unevaluatedProperties with nested properties - with additional properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"allOf\": [{\"properties\": {\"bar\": {\"type\": \"string\"}}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse(
    "{\"foo\": \"foo\", \"bar\": \"bar\", \"baz\": \"baz\"}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g8] unevaluatedProperties with nested patternProperties - with no additional properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"allOf\": [{\"patternProperties\": {\"^bar\": {\"type\": \"string\"}}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g8] unevaluatedProperties with nested patternProperties - with additional properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"allOf\": [{\"patternProperties\": {\"^bar\": {\"type\": \"string\"}}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse(
    "{\"foo\": \"foo\", \"bar\": \"bar\", \"baz\": \"baz\"}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g9] unevaluatedProperties with nested additionalProperties - with no additional properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"allOf\": [{\"additionalProperties\": true}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g9] unevaluatedProperties with nested additionalProperties - with additional properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"allOf\": [{\"additionalProperties\": true}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g10] unevaluatedProperties with nested unevaluatedProperties - with no nested unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"allOf\": [{\"unevaluatedProperties\": true}], \"unevaluatedProperties\": {\"type\": \"string\", \"maxLength\": 2}}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g10] unevaluatedProperties with nested unevaluatedProperties - with nested unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"allOf\": [{\"unevaluatedProperties\": true}], \"unevaluatedProperties\": {\"type\": \"string\", \"maxLength\": 2}}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g11] unevaluatedProperties with anyOf - when one matches and has no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"anyOf\": [{\"properties\": {\"bar\": {\"const\": \"bar\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"baz\": {\"const\": \"baz\"}}, \"required\": [\"baz\"]}, {\"properties\": {\"quux\": {\"const\": \"quux\"}}, \"required\": [\"quux\"]}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g11] unevaluatedProperties with anyOf - when one matches and has unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"anyOf\": [{\"properties\": {\"bar\": {\"const\": \"bar\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"baz\": {\"const\": \"baz\"}}, \"required\": [\"baz\"]}, {\"properties\": {\"quux\": {\"const\": \"quux\"}}, \"required\": [\"quux\"]}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse(
    "{\"foo\": \"foo\", \"bar\": \"bar\", \"baz\": \"not-baz\"}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g11] unevaluatedProperties with anyOf - when two match and has no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"anyOf\": [{\"properties\": {\"bar\": {\"const\": \"bar\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"baz\": {\"const\": \"baz\"}}, \"required\": [\"baz\"]}, {\"properties\": {\"quux\": {\"const\": \"quux\"}}, \"required\": [\"quux\"]}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse(
    "{\"foo\": \"foo\", \"bar\": \"bar\", \"baz\": \"baz\"}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g11] unevaluatedProperties with anyOf - when two match and has unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"anyOf\": [{\"properties\": {\"bar\": {\"const\": \"bar\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"baz\": {\"const\": \"baz\"}}, \"required\": [\"baz\"]}, {\"properties\": {\"quux\": {\"const\": \"quux\"}}, \"required\": [\"quux\"]}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse(
    "{\"foo\": \"foo\", \"bar\": \"bar\", \"baz\": \"baz\", \"quux\": \"not-quux\"}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g12] unevaluatedProperties with oneOf - with no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"oneOf\": [{\"properties\": {\"bar\": {\"const\": \"bar\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"baz\": {\"const\": \"baz\"}}, \"required\": [\"baz\"]}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g12] unevaluatedProperties with oneOf - with unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"oneOf\": [{\"properties\": {\"bar\": {\"const\": \"bar\"}}, \"required\": [\"bar\"]}, {\"properties\": {\"baz\": {\"const\": \"baz\"}}, \"required\": [\"baz\"]}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse(
    "{\"foo\": \"foo\", \"bar\": \"bar\", \"quux\": \"quux\"}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g13] unevaluatedProperties with not - with unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"not\": {\"not\": {\"properties\": {\"bar\": {\"const\": \"bar\"}}, \"required\": [\"bar\"]}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g14] unevaluatedProperties with if/then/else - when if is true and has no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"properties\": {\"foo\": {\"const\": \"then\"}}, \"required\": [\"foo\"]}, \"then\": {\"properties\": {\"bar\": {\"type\": \"string\"}}, \"required\": [\"bar\"]}, \"else\": {\"properties\": {\"baz\": {\"type\": \"string\"}}, \"required\": [\"baz\"]}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"then\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g14] unevaluatedProperties with if/then/else - when if is true and has unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"properties\": {\"foo\": {\"const\": \"then\"}}, \"required\": [\"foo\"]}, \"then\": {\"properties\": {\"bar\": {\"type\": \"string\"}}, \"required\": [\"bar\"]}, \"else\": {\"properties\": {\"baz\": {\"type\": \"string\"}}, \"required\": [\"baz\"]}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse(
    "{\"foo\": \"then\", \"bar\": \"bar\", \"baz\": \"baz\"}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g14] unevaluatedProperties with if/then/else - when if is false and has no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"properties\": {\"foo\": {\"const\": \"then\"}}, \"required\": [\"foo\"]}, \"then\": {\"properties\": {\"bar\": {\"type\": \"string\"}}, \"required\": [\"bar\"]}, \"else\": {\"properties\": {\"baz\": {\"type\": \"string\"}}, \"required\": [\"baz\"]}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"baz\": \"baz\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g14] unevaluatedProperties with if/then/else - when if is false and has unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"properties\": {\"foo\": {\"const\": \"then\"}}, \"required\": [\"foo\"]}, \"then\": {\"properties\": {\"bar\": {\"type\": \"string\"}}, \"required\": [\"bar\"]}, \"else\": {\"properties\": {\"baz\": {\"type\": \"string\"}}, \"required\": [\"baz\"]}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"else\", \"baz\": \"baz\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g15] unevaluatedProperties with if/then/else, then not defined - when if is true and has no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"properties\": {\"foo\": {\"const\": \"then\"}}, \"required\": [\"foo\"]}, \"else\": {\"properties\": {\"baz\": {\"type\": \"string\"}}, \"required\": [\"baz\"]}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"then\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g15] unevaluatedProperties with if/then/else, then not defined - when if is true and has unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"properties\": {\"foo\": {\"const\": \"then\"}}, \"required\": [\"foo\"]}, \"else\": {\"properties\": {\"baz\": {\"type\": \"string\"}}, \"required\": [\"baz\"]}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"then\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g15] unevaluatedProperties with if/then/else, then not defined - when if is false and has no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"properties\": {\"foo\": {\"const\": \"then\"}}, \"required\": [\"foo\"]}, \"else\": {\"properties\": {\"baz\": {\"type\": \"string\"}}, \"required\": [\"baz\"]}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"baz\": \"baz\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g15] unevaluatedProperties with if/then/else, then not defined - when if is false and has unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"properties\": {\"foo\": {\"const\": \"then\"}}, \"required\": [\"foo\"]}, \"else\": {\"properties\": {\"baz\": {\"type\": \"string\"}}, \"required\": [\"baz\"]}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"else\", \"baz\": \"baz\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g16] unevaluatedProperties with if/then/else, else not defined - when if is true and has no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"properties\": {\"foo\": {\"const\": \"then\"}}, \"required\": [\"foo\"]}, \"then\": {\"properties\": {\"bar\": {\"type\": \"string\"}}, \"required\": [\"bar\"]}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"then\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g16] unevaluatedProperties with if/then/else, else not defined - when if is true and has unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"properties\": {\"foo\": {\"const\": \"then\"}}, \"required\": [\"foo\"]}, \"then\": {\"properties\": {\"bar\": {\"type\": \"string\"}}, \"required\": [\"bar\"]}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse(
    "{\"foo\": \"then\", \"bar\": \"bar\", \"baz\": \"baz\"}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g16] unevaluatedProperties with if/then/else, else not defined - when if is false and has no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"properties\": {\"foo\": {\"const\": \"then\"}}, \"required\": [\"foo\"]}, \"then\": {\"properties\": {\"bar\": {\"type\": \"string\"}}, \"required\": [\"bar\"]}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"baz\": \"baz\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g16] unevaluatedProperties with if/then/else, else not defined - when if is false and has unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"properties\": {\"foo\": {\"const\": \"then\"}}, \"required\": [\"foo\"]}, \"then\": {\"properties\": {\"bar\": {\"type\": \"string\"}}, \"required\": [\"bar\"]}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"else\", \"baz\": \"baz\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g17] unevaluatedProperties with dependentSchemas - with no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"dependentSchemas\": {\"foo\": {\"properties\": {\"bar\": {\"const\": \"bar\"}}, \"required\": [\"bar\"]}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g17] unevaluatedProperties with dependentSchemas - with unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"dependentSchemas\": {\"foo\": {\"properties\": {\"bar\": {\"const\": \"bar\"}}, \"required\": [\"bar\"]}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g18] unevaluatedProperties with boolean schemas - with no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"allOf\": [true], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g18] unevaluatedProperties with boolean schemas - with unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"allOf\": [true], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g19] unevaluatedProperties with $ref - with no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"#/$defs/bar\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"unevaluatedProperties\": false, \"$defs\": {\"bar\": {\"properties\": {\"bar\": {\"type\": \"string\"}}}}}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g19] unevaluatedProperties with $ref - with unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"#/$defs/bar\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"unevaluatedProperties\": false, \"$defs\": {\"bar\": {\"properties\": {\"bar\": {\"type\": \"string\"}}}}}",
  )
  let data = @json.parse(
    "{\"foo\": \"foo\", \"bar\": \"bar\", \"baz\": \"baz\"}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g20] unevaluatedProperties before $ref - with no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": false, \"properties\": {\"foo\": {\"type\": \"string\"}}, \"$ref\": \"#/$defs/bar\", \"$defs\": {\"bar\": {\"properties\": {\"bar\": {\"type\": \"string\"}}}}}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g20] unevaluatedProperties before $ref - with unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": false, \"properties\": {\"foo\": {\"type\": \"string\"}}, \"$ref\": \"#/$defs/bar\", \"$defs\": {\"bar\": {\"properties\": {\"bar\": {\"type\": \"string\"}}}}}",
  )
  let data = @json.parse(
    "{\"foo\": \"foo\", \"bar\": \"bar\", \"baz\": \"baz\"}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g21] unevaluatedProperties with $dynamicRef - with no unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://example.com/unevaluated-properties-with-dynamic-ref/derived\", \"$ref\": \"./baseSchema\", \"$defs\": {\"derived\": {\"$dynamicAnchor\": \"addons\", \"properties\": {\"bar\": {\"type\": \"string\"}}}, \"baseSchema\": {\"$id\": \"./baseSchema\", \"$comment\": \"unevaluatedProperties comes first so it's more likely to catch bugs with implementations that are sensitive to keyword ordering\", \"unevaluatedProperties\": false, \"properties\": {\"foo\": {\"type\": \"string\"}}, \"$dynamicRef\": \"#addons\", \"$defs\": {\"defaultAddons\": {\"$comment\": \"Needed to satisfy the bookending requirement\", \"$dynamicAnchor\": \"addons\"}}}}}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g21] unevaluatedProperties with $dynamicRef - with unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://example.com/unevaluated-properties-with-dynamic-ref/derived\", \"$ref\": \"./baseSchema\", \"$defs\": {\"derived\": {\"$dynamicAnchor\": \"addons\", \"properties\": {\"bar\": {\"type\": \"string\"}}}, \"baseSchema\": {\"$id\": \"./baseSchema\", \"$comment\": \"unevaluatedProperties comes first so it's more likely to catch bugs with implementations that are sensitive to keyword ordering\", \"unevaluatedProperties\": false, \"properties\": {\"foo\": {\"type\": \"string\"}}, \"$dynamicRef\": \"#addons\", \"$defs\": {\"defaultAddons\": {\"$comment\": \"Needed to satisfy the bookending requirement\", \"$dynamicAnchor\": \"addons\"}}}}}",
  )
  let data = @json.parse(
    "{\"foo\": \"foo\", \"bar\": \"bar\", \"baz\": \"baz\"}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g22] unevaluatedProperties can't see inside cousins - always fails" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"foo\": true}}, {\"unevaluatedProperties\": false}]}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g23] unevaluatedProperties can't see inside cousins (reverse order) - always fails" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"unevaluatedProperties\": false}, {\"properties\": {\"foo\": true}}]}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g24] nested unevaluatedProperties, outer false, inner true, properties outside - with no nested unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"allOf\": [{\"unevaluatedProperties\": true}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g24] nested unevaluatedProperties, outer false, inner true, properties outside - with nested unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"allOf\": [{\"unevaluatedProperties\": true}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g25] nested unevaluatedProperties, outer false, inner true, properties inside - with no nested unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"foo\": {\"type\": \"string\"}}, \"unevaluatedProperties\": true}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g25] nested unevaluatedProperties, outer false, inner true, properties inside - with nested unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"foo\": {\"type\": \"string\"}}, \"unevaluatedProperties\": true}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g26] nested unevaluatedProperties, outer true, inner false, properties outside - with no nested unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"allOf\": [{\"unevaluatedProperties\": false}], \"unevaluatedProperties\": true}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g26] nested unevaluatedProperties, outer true, inner false, properties outside - with nested unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"type\": \"string\"}}, \"allOf\": [{\"unevaluatedProperties\": false}], \"unevaluatedProperties\": true}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g27] nested unevaluatedProperties, outer true, inner false, properties inside - with no nested unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"foo\": {\"type\": \"string\"}}, \"unevaluatedProperties\": false}], \"unevaluatedProperties\": true}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g27] nested unevaluatedProperties, outer true, inner false, properties inside - with nested unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"foo\": {\"type\": \"string\"}}, \"unevaluatedProperties\": false}], \"unevaluatedProperties\": true}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g28] cousin unevaluatedProperties, true and false, true with properties - with no nested unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"foo\": {\"type\": \"string\"}}, \"unevaluatedProperties\": true}, {\"unevaluatedProperties\": false}]}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g28] cousin unevaluatedProperties, true and false, true with properties - with nested unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"foo\": {\"type\": \"string\"}}, \"unevaluatedProperties\": true}, {\"unevaluatedProperties\": false}]}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g29] cousin unevaluatedProperties, true and false, false with properties - with no nested unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"unevaluatedProperties\": true}, {\"properties\": {\"foo\": {\"type\": \"string\"}}, \"unevaluatedProperties\": false}]}",
  )
  let data = @json.parse("{\"foo\": \"foo\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g29] cousin unevaluatedProperties, true and false, false with properties - with nested unevaluated properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"unevaluatedProperties\": true}, {\"properties\": {\"foo\": {\"type\": \"string\"}}, \"unevaluatedProperties\": false}]}",
  )
  let data = @json.parse("{\"foo\": \"foo\", \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g30] property is evaluated in an uncle schema to unevaluatedProperties - no extra properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"properties\": {\"bar\": {\"type\": \"string\"}}, \"unevaluatedProperties\": false}}, \"anyOf\": [{\"properties\": {\"foo\": {\"properties\": {\"faz\": {\"type\": \"string\"}}}}}]}",
  )
  let data = @json.parse("{\"foo\": {\"bar\": \"test\"}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g30] property is evaluated in an uncle schema to unevaluatedProperties - uncle keyword evaluation is not significant" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"properties\": {\"bar\": {\"type\": \"string\"}}, \"unevaluatedProperties\": false}}, \"anyOf\": [{\"properties\": {\"foo\": {\"properties\": {\"faz\": {\"type\": \"string\"}}}}}]}",
  )
  let data = @json.parse("{\"foo\": {\"bar\": \"test\", \"faz\": \"test\"}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g31] in-place applicator siblings, allOf has unevaluated - base case: both properties present" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"foo\": true}, \"unevaluatedProperties\": false}], \"anyOf\": [{\"properties\": {\"bar\": true}}]}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g31] in-place applicator siblings, allOf has unevaluated - in place applicator siblings, bar is missing" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"foo\": true}, \"unevaluatedProperties\": false}], \"anyOf\": [{\"properties\": {\"bar\": true}}]}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g31] in-place applicator siblings, allOf has unevaluated - in place applicator siblings, foo is missing" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"foo\": true}, \"unevaluatedProperties\": false}], \"anyOf\": [{\"properties\": {\"bar\": true}}]}",
  )
  let data = @json.parse("{\"bar\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g32] in-place applicator siblings, anyOf has unevaluated - base case: both properties present" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"foo\": true}}], \"anyOf\": [{\"properties\": {\"bar\": true}, \"unevaluatedProperties\": false}]}",
  )
  let data = @json.parse("{\"foo\": 1, \"bar\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g32] in-place applicator siblings, anyOf has unevaluated - in place applicator siblings, bar is missing" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"foo\": true}}], \"anyOf\": [{\"properties\": {\"bar\": true}, \"unevaluatedProperties\": false}]}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g32] in-place applicator siblings, anyOf has unevaluated - in place applicator siblings, foo is missing" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"properties\": {\"foo\": true}}], \"anyOf\": [{\"properties\": {\"bar\": true}, \"unevaluatedProperties\": false}]}",
  )
  let data = @json.parse("{\"bar\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g33] unevaluatedProperties + single cyclic ref - Empty is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"x\": {\"$ref\": \"#\"}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g33] unevaluatedProperties + single cyclic ref - Single is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"x\": {\"$ref\": \"#\"}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"x\": {}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g33] unevaluatedProperties + single cyclic ref - Unevaluated on 1st level is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"x\": {\"$ref\": \"#\"}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"x\": {}, \"y\": {}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g33] unevaluatedProperties + single cyclic ref - Nested is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"x\": {\"$ref\": \"#\"}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"x\": {\"x\": {}}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g33] unevaluatedProperties + single cyclic ref - Unevaluated on 2nd level is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"x\": {\"$ref\": \"#\"}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"x\": {\"x\": {}, \"y\": {}}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g33] unevaluatedProperties + single cyclic ref - Deep nested is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"x\": {\"$ref\": \"#\"}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"x\": {\"x\": {\"x\": {}}}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g33] unevaluatedProperties + single cyclic ref - Unevaluated on 3rd level is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"x\": {\"$ref\": \"#\"}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"x\": {\"x\": {\"x\": {}, \"y\": {}}}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g34] unevaluatedProperties + ref inside allOf / oneOf - Empty is invalid (no x or y)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"properties\": {\"a\": true}}, \"two\": {\"required\": [\"x\"], \"properties\": {\"x\": true}}}, \"allOf\": [{\"$ref\": \"#/$defs/one\"}, {\"properties\": {\"b\": true}}, {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"y\"], \"properties\": {\"y\": true}}]}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g34] unevaluatedProperties + ref inside allOf / oneOf - a and b are invalid (no x or y)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"properties\": {\"a\": true}}, \"two\": {\"required\": [\"x\"], \"properties\": {\"x\": true}}}, \"allOf\": [{\"$ref\": \"#/$defs/one\"}, {\"properties\": {\"b\": true}}, {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"y\"], \"properties\": {\"y\": true}}]}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"a\": 1, \"b\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g34] unevaluatedProperties + ref inside allOf / oneOf - x and y are invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"properties\": {\"a\": true}}, \"two\": {\"required\": [\"x\"], \"properties\": {\"x\": true}}}, \"allOf\": [{\"$ref\": \"#/$defs/one\"}, {\"properties\": {\"b\": true}}, {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"y\"], \"properties\": {\"y\": true}}]}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"x\": 1, \"y\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g34] unevaluatedProperties + ref inside allOf / oneOf - a and x are valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"properties\": {\"a\": true}}, \"two\": {\"required\": [\"x\"], \"properties\": {\"x\": true}}}, \"allOf\": [{\"$ref\": \"#/$defs/one\"}, {\"properties\": {\"b\": true}}, {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"y\"], \"properties\": {\"y\": true}}]}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"a\": 1, \"x\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g34] unevaluatedProperties + ref inside allOf / oneOf - a and y are valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"properties\": {\"a\": true}}, \"two\": {\"required\": [\"x\"], \"properties\": {\"x\": true}}}, \"allOf\": [{\"$ref\": \"#/$defs/one\"}, {\"properties\": {\"b\": true}}, {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"y\"], \"properties\": {\"y\": true}}]}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"a\": 1, \"y\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g34] unevaluatedProperties + ref inside allOf / oneOf - a and b and x are valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"properties\": {\"a\": true}}, \"two\": {\"required\": [\"x\"], \"properties\": {\"x\": true}}}, \"allOf\": [{\"$ref\": \"#/$defs/one\"}, {\"properties\": {\"b\": true}}, {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"y\"], \"properties\": {\"y\": true}}]}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"a\": 1, \"b\": 1, \"x\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g34] unevaluatedProperties + ref inside allOf / oneOf - a and b and y are valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"properties\": {\"a\": true}}, \"two\": {\"required\": [\"x\"], \"properties\": {\"x\": true}}}, \"allOf\": [{\"$ref\": \"#/$defs/one\"}, {\"properties\": {\"b\": true}}, {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"y\"], \"properties\": {\"y\": true}}]}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"a\": 1, \"b\": 1, \"y\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g34] unevaluatedProperties + ref inside allOf / oneOf - a and b and x and y are invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"properties\": {\"a\": true}}, \"two\": {\"required\": [\"x\"], \"properties\": {\"x\": true}}}, \"allOf\": [{\"$ref\": \"#/$defs/one\"}, {\"properties\": {\"b\": true}}, {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"y\"], \"properties\": {\"y\": true}}]}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"a\": 1, \"b\": 1, \"x\": 1, \"y\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - Empty is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - a is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"a\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - b is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"b\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - c is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"c\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - d is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"d\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - a + b is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"a\": 1, \"b\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - a + c is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"a\": 1, \"c\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - a + d is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"a\": 1, \"d\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - b + c is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"b\": 1, \"c\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - b + d is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"b\": 1, \"d\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - c + d is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"c\": 1, \"d\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - xx is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"xx\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - xx + foox is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"xx\": 1, \"foox\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - xx + foo is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"xx\": 1, \"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - xx + a is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"xx\": 1, \"a\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - xx + b is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"xx\": 1, \"b\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - xx + c is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"xx\": 1, \"c\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - xx + d is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"xx\": 1, \"d\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - all is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"all\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - all + foo is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"all\": 1, \"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g35] dynamic evalation inside nested refs - all + a is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"one\": {\"oneOf\": [{\"$ref\": \"#/$defs/two\"}, {\"required\": [\"b\"], \"properties\": {\"b\": true}}, {\"required\": [\"xx\"], \"patternProperties\": {\"x\": true}}, {\"required\": [\"all\"], \"unevaluatedProperties\": true}]}, \"two\": {\"oneOf\": [{\"required\": [\"c\"], \"properties\": {\"c\": true}}, {\"required\": [\"d\"], \"properties\": {\"d\": true}}]}}, \"oneOf\": [{\"$ref\": \"#/$defs/one\"}, {\"required\": [\"a\"], \"properties\": {\"a\": true}}], \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"all\": 1, \"a\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g36] non-object instances are valid - ignores booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("true")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g36] non-object instances are valid - ignores integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("123")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g36] non-object instances are valid - ignores floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("1.0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g36] non-object instances are valid - ignores arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g36] non-object instances are valid - ignores strings" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g36] non-object instances are valid - ignores null" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g37] unevaluatedProperties with null valued instance properties - allows null valued properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedProperties\": {\"type\": \"null\"}}",
  )
  let data = @json.parse("{\"foo\": null}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g38] unevaluatedProperties not affected by propertyNames - allows only number properties" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"maxLength\": 1}, \"unevaluatedProperties\": {\"type\": \"number\"}}",
  )
  let data = @json.parse("{\"a\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g38] unevaluatedProperties not affected by propertyNames - string property is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"propertyNames\": {\"maxLength\": 1}, \"unevaluatedProperties\": {\"type\": \"number\"}}",
  )
  let data = @json.parse("{\"a\": \"b\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g39] unevaluatedProperties can see annotations from if without then and else - valid in case if is evaluated" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"patternProperties\": {\"foo\": {\"type\": \"string\"}}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"a\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g39] unevaluatedProperties can see annotations from if without then and else - invalid in case if is evaluated" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"patternProperties\": {\"foo\": {\"type\": \"string\"}}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"bar\": \"a\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g40] dependentSchemas with unevaluatedProperties - unevaluatedProperties doesn't consider dependentSchemas" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo2\": {}}, \"dependentSchemas\": {\"foo\": {}, \"foo2\": {\"properties\": {\"bar\": {}}}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": \"\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g40] dependentSchemas with unevaluatedProperties - unevaluatedProperties doesn't see bar when foo2 is absent" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo2\": {}}, \"dependentSchemas\": {\"foo\": {}, \"foo2\": {\"properties\": {\"bar\": {}}}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"bar\": \"\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g40] dependentSchemas with unevaluatedProperties - unevaluatedProperties sees bar when foo2 is present" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo2\": {}}, \"dependentSchemas\": {\"foo\": {}, \"foo2\": {\"properties\": {\"bar\": {}}}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo2\": \"\", \"bar\": \"\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g41] Evaluated properties collection needs to consider instance location - with an unevaluated property that exists at another location" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"properties\": {\"bar\": {\"type\": \"string\"}}}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": {\"bar\": \"foo\"}, \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g42] Evaluated properties collection needs to consider instance location with patternProperties - with only the nested evaluated property" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"patternProperties\": {\"^bar$\": {\"type\": \"string\"}}}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": {\"bar\": \"foo\"}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g42] Evaluated properties collection needs to consider instance location with patternProperties - with an unevaluated property that exists at another location" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"patternProperties\": {\"^bar$\": {\"type\": \"string\"}}}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": {\"bar\": \"foo\"}, \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedProperties [g43] Evaluated properties collection needs to consider instance location with additionalPropert - with only the nested evaluated property" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"additionalProperties\": {\"type\": \"string\"}}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": {\"bar\": \"foo\"}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedProperties [g43] Evaluated properties collection needs to consider instance location with additionalPropert - with an unevaluated property that exists at another location" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"additionalProperties\": {\"type\": \"string\"}}}, \"unevaluatedProperties\": false}",
  )
  let data = @json.parse("{\"foo\": {\"bar\": \"foo\"}, \"bar\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
