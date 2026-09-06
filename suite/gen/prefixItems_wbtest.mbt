// Generated from JSON-Schema-Test-Suite tests/draft2020-12/prefixItems.json
// (vendored copy in suite/fixtures/prefixItems.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "prefixItems [g0] a schema given for prefixItems - correct types" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"integer\"}, {\"type\": \"string\"}]}",
  )
  let data = @json.parse("[1, \"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "prefixItems [g0] a schema given for prefixItems - wrong types" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"integer\"}, {\"type\": \"string\"}]}",
  )
  let data = @json.parse("[\"foo\", 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "prefixItems [g0] a schema given for prefixItems - incomplete array of items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"integer\"}, {\"type\": \"string\"}]}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "prefixItems [g0] a schema given for prefixItems - array with additional items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"integer\"}, {\"type\": \"string\"}]}",
  )
  let data = @json.parse("[1, \"foo\", true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "prefixItems [g0] a schema given for prefixItems - empty array" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"integer\"}, {\"type\": \"string\"}]}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "prefixItems [g0] a schema given for prefixItems - JavaScript pseudo-array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"integer\"}, {\"type\": \"string\"}]}",
  )
  let data = @json.parse(
    "{\"0\": \"invalid\", \"1\": \"valid\", \"length\": 2}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "prefixItems [g1] prefixItems with boolean schemas - array with one item is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [true, false]}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "prefixItems [g1] prefixItems with boolean schemas - array with two items is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [true, false]}",
  )
  let data = @json.parse("[1, \"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "prefixItems [g1] prefixItems with boolean schemas - empty array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [true, false]}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "prefixItems [g2] additional items are allowed by default - only the first item is validated" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"integer\"}]}",
  )
  let data = @json.parse("[1, \"foo\", false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "prefixItems [g3] prefixItems with null instance elements - allows null elements" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"null\"}]}",
  )
  let data = @json.parse("[null]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
