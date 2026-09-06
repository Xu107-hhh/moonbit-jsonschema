// Generated from JSON-Schema-Test-Suite tests/draft2020-12/anchor.json
// (vendored copy in suite/fixtures/anchor.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "anchor [g0] Location-independent identifier - match" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"#foo\", \"$defs\": {\"A\": {\"$anchor\": \"foo\", \"type\": \"integer\"}}}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anchor [g0] Location-independent identifier - mismatch" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"#foo\", \"$defs\": {\"A\": {\"$anchor\": \"foo\", \"type\": \"integer\"}}}",
  )
  let data = @json.parse("\"a\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "anchor [g1] Location-independent identifier with absolute URI - match" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"http://localhost:1234/draft2020-12/bar#foo\", \"$defs\": {\"A\": {\"$id\": \"http://localhost:1234/draft2020-12/bar\", \"$anchor\": \"foo\", \"type\": \"integer\"}}}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anchor [g1] Location-independent identifier with absolute URI - mismatch" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"http://localhost:1234/draft2020-12/bar#foo\", \"$defs\": {\"A\": {\"$id\": \"http://localhost:1234/draft2020-12/bar\", \"$anchor\": \"foo\", \"type\": \"integer\"}}}",
  )
  let data = @json.parse("\"a\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "anchor [g2] Location-independent identifier with base URI change in subschema - match" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/root\", \"$ref\": \"http://localhost:1234/draft2020-12/nested.json#foo\", \"$defs\": {\"A\": {\"$id\": \"nested.json\", \"$defs\": {\"B\": {\"$anchor\": \"foo\", \"type\": \"integer\"}}}}}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anchor [g2] Location-independent identifier with base URI change in subschema - mismatch" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/root\", \"$ref\": \"http://localhost:1234/draft2020-12/nested.json#foo\", \"$defs\": {\"A\": {\"$id\": \"nested.json\", \"$defs\": {\"B\": {\"$anchor\": \"foo\", \"type\": \"integer\"}}}}}",
  )
  let data = @json.parse("\"a\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "anchor [g3] same $anchor with different base uri - $ref resolves to /$defs/A/allOf/1" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/foobar\", \"$defs\": {\"A\": {\"$id\": \"child1\", \"allOf\": [{\"$id\": \"child2\", \"$anchor\": \"my_anchor\", \"type\": \"number\"}, {\"$anchor\": \"my_anchor\", \"type\": \"string\"}]}}, \"$ref\": \"child1#my_anchor\"}",
  )
  let data = @json.parse("\"a\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "anchor [g3] same $anchor with different base uri - $ref does not resolve to /$defs/A/allOf/0" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/foobar\", \"$defs\": {\"A\": {\"$id\": \"child1\", \"allOf\": [{\"$id\": \"child2\", \"$anchor\": \"my_anchor\", \"type\": \"number\"}, {\"$anchor\": \"my_anchor\", \"type\": \"string\"}]}}, \"$ref\": \"child1#my_anchor\"}",
  )
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
