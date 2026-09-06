// Generated from JSON-Schema-Test-Suite tests/draft2020-12/infinite-loop-detection.json
// (vendored copy in suite/fixtures/infinite-loop-detection.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "infinite-loop-detection [g0] evaluating the same schema location against the same data location twice is not a sign of  - passing case" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"int\": {\"type\": \"integer\"}}, \"allOf\": [{\"properties\": {\"foo\": {\"$ref\": \"#/$defs/int\"}}}, {\"additionalProperties\": {\"$ref\": \"#/$defs/int\"}}]}",
  )
  let data = @json.parse("{\"foo\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "infinite-loop-detection [g0] evaluating the same schema location against the same data location twice is not a sign of  - failing case" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"int\": {\"type\": \"integer\"}}, \"allOf\": [{\"properties\": {\"foo\": {\"$ref\": \"#/$defs/int\"}}}, {\"additionalProperties\": {\"$ref\": \"#/$defs/int\"}}]}",
  )
  let data = @json.parse("{\"foo\": \"a string\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
