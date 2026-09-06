// Generated from JSON-Schema-Test-Suite tests/draft2020-12/content.json
// (vendored copy in suite/fixtures/content.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "content [g0] validation of string-encoded content based on media type - a valid JSON document" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentMediaType\": \"application/json\"}",
  )
  let data = @json.parse("\"{\\\"foo\\\": \\\"bar\\\"}\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g0] validation of string-encoded content based on media type - an invalid JSON document; validates true" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentMediaType\": \"application/json\"}",
  )
  let data = @json.parse("\"{:}\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g0] validation of string-encoded content based on media type - ignores non-strings" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentMediaType\": \"application/json\"}",
  )
  let data = @json.parse("100")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g1] validation of binary string-encoding - a valid base64 string" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentEncoding\": \"base64\"}",
  )
  let data = @json.parse("\"eyJmb28iOiAiYmFyIn0K\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g1] validation of binary string-encoding - an invalid base64 string (% is not a valid character); validates true" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentEncoding\": \"base64\"}",
  )
  let data = @json.parse("\"eyJmb28iOi%iYmFyIn0K\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g1] validation of binary string-encoding - ignores non-strings" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentEncoding\": \"base64\"}",
  )
  let data = @json.parse("100")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g2] validation of binary-encoded media type documents - a valid base64-encoded JSON document" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentMediaType\": \"application/json\", \"contentEncoding\": \"base64\"}",
  )
  let data = @json.parse("\"eyJmb28iOiAiYmFyIn0K\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g2] validation of binary-encoded media type documents - a validly-encoded invalid JSON document; validates true" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentMediaType\": \"application/json\", \"contentEncoding\": \"base64\"}",
  )
  let data = @json.parse("\"ezp9Cg==\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g2] validation of binary-encoded media type documents - an invalid base64 string that is valid JSON; validates true" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentMediaType\": \"application/json\", \"contentEncoding\": \"base64\"}",
  )
  let data = @json.parse("\"{}\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g2] validation of binary-encoded media type documents - ignores non-strings" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentMediaType\": \"application/json\", \"contentEncoding\": \"base64\"}",
  )
  let data = @json.parse("100")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g3] validation of binary-encoded media type documents with schema - a valid base64-encoded JSON document" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentMediaType\": \"application/json\", \"contentEncoding\": \"base64\", \"contentSchema\": {\"type\": \"object\", \"required\": [\"foo\"], \"properties\": {\"foo\": {\"type\": \"string\"}}}}",
  )
  let data = @json.parse("\"eyJmb28iOiAiYmFyIn0K\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g3] validation of binary-encoded media type documents with schema - another valid base64-encoded JSON document" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentMediaType\": \"application/json\", \"contentEncoding\": \"base64\", \"contentSchema\": {\"type\": \"object\", \"required\": [\"foo\"], \"properties\": {\"foo\": {\"type\": \"string\"}}}}",
  )
  let data = @json.parse("\"eyJib28iOiAyMCwgImZvbyI6ICJiYXoifQ==\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g3] validation of binary-encoded media type documents with schema - an invalid base64-encoded JSON document; validates true" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentMediaType\": \"application/json\", \"contentEncoding\": \"base64\", \"contentSchema\": {\"type\": \"object\", \"required\": [\"foo\"], \"properties\": {\"foo\": {\"type\": \"string\"}}}}",
  )
  let data = @json.parse("\"eyJib28iOiAyMH0=\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g3] validation of binary-encoded media type documents with schema - an empty object as a base64-encoded JSON document; validates true" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentMediaType\": \"application/json\", \"contentEncoding\": \"base64\", \"contentSchema\": {\"type\": \"object\", \"required\": [\"foo\"], \"properties\": {\"foo\": {\"type\": \"string\"}}}}",
  )
  let data = @json.parse("\"e30=\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g3] validation of binary-encoded media type documents with schema - an empty array as a base64-encoded JSON document" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentMediaType\": \"application/json\", \"contentEncoding\": \"base64\", \"contentSchema\": {\"type\": \"object\", \"required\": [\"foo\"], \"properties\": {\"foo\": {\"type\": \"string\"}}}}",
  )
  let data = @json.parse("\"W10=\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g3] validation of binary-encoded media type documents with schema - a validly-encoded invalid JSON document; validates true" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentMediaType\": \"application/json\", \"contentEncoding\": \"base64\", \"contentSchema\": {\"type\": \"object\", \"required\": [\"foo\"], \"properties\": {\"foo\": {\"type\": \"string\"}}}}",
  )
  let data = @json.parse("\"ezp9Cg==\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g3] validation of binary-encoded media type documents with schema - an invalid base64 string that is valid JSON; validates true" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentMediaType\": \"application/json\", \"contentEncoding\": \"base64\", \"contentSchema\": {\"type\": \"object\", \"required\": [\"foo\"], \"properties\": {\"foo\": {\"type\": \"string\"}}}}",
  )
  let data = @json.parse("\"{}\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "content [g3] validation of binary-encoded media type documents with schema - ignores non-strings" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contentMediaType\": \"application/json\", \"contentEncoding\": \"base64\", \"contentSchema\": {\"type\": \"object\", \"required\": [\"foo\"], \"properties\": {\"foo\": {\"type\": \"string\"}}}}",
  )
  let data = @json.parse("100")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
