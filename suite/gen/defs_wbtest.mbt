// Generated from JSON-Schema-Test-Suite tests/draft2020-12/defs.json
// (vendored copy in suite/fixtures/defs.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "defs [g0] validate definition against metaschema - valid definition schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"https://json-schema.org/draft/2020-12/schema\"}",
  )
  let data = @json.parse("{\"$defs\": {\"foo\": {\"type\": \"integer\"}}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "defs [g0] validate definition against metaschema - invalid definition schema" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"https://json-schema.org/draft/2020-12/schema\"}",
  )
  let data = @json.parse("{\"$defs\": {\"foo\": {\"type\": 1}}}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
