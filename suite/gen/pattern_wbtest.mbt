// Generated from JSON-Schema-Test-Suite tests/draft2020-12/pattern.json
// (vendored copy in suite/fixtures/pattern.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "pattern [g0] pattern validation - a matching pattern is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"pattern\": \"^a*$\"}",
  )
  let data = @json.parse("\"aaa\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "pattern [g0] pattern validation - a non-matching pattern is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"pattern\": \"^a*$\"}",
  )
  let data = @json.parse("\"abc\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "pattern [g0] pattern validation - ignores booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"pattern\": \"^a*$\"}",
  )
  let data = @json.parse("true")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "pattern [g0] pattern validation - ignores integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"pattern\": \"^a*$\"}",
  )
  let data = @json.parse("123")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "pattern [g0] pattern validation - ignores floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"pattern\": \"^a*$\"}",
  )
  let data = @json.parse("1.0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "pattern [g0] pattern validation - ignores objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"pattern\": \"^a*$\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "pattern [g0] pattern validation - ignores arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"pattern\": \"^a*$\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "pattern [g0] pattern validation - ignores null" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"pattern\": \"^a*$\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "pattern [g1] pattern is not anchored - matches a substring" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"pattern\": \"a+\"}",
  )
  let data = @json.parse("\"xxaayy\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "pattern [g2] pattern with Unicode property escape requires unicode mode - ASCII letters match" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"string\", \"pattern\": \"^\\\\p{Letter}+$\"}",
  )
  let data = @json.parse("\"Hello\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "pattern [g2] pattern with Unicode property escape requires unicode mode - Non-ASCII letters match" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"string\", \"pattern\": \"^\\\\p{Letter}+$\"}",
  )
  let data = @json.parse("\"π\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "pattern [g2] pattern with Unicode property escape requires unicode mode - Digits do not match" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"string\", \"pattern\": \"^\\\\p{Letter}+$\"}",
  )
  let data = @json.parse("\"123\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
