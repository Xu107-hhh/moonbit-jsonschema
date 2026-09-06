// Generated from JSON-Schema-Test-Suite tests/draft2020-12/contains.json
// (vendored copy in suite/fixtures/contains.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "contains [g0] contains keyword validation - array with item matching schema (5) is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"minimum\": 5}}",
  )
  let data = @json.parse("[3, 4, 5]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "contains [g0] contains keyword validation - array with item matching schema (6) is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"minimum\": 5}}",
  )
  let data = @json.parse("[3, 4, 6]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "contains [g0] contains keyword validation - array with two items matching schema (5, 6) is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"minimum\": 5}}",
  )
  let data = @json.parse("[3, 4, 5, 6]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "contains [g0] contains keyword validation - array without items matching schema is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"minimum\": 5}}",
  )
  let data = @json.parse("[2, 3, 4]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "contains [g0] contains keyword validation - empty array is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"minimum\": 5}}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "contains [g0] contains keyword validation - not array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"minimum\": 5}}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "contains [g1] contains keyword with const keyword - array with item 5 is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 5}}",
  )
  let data = @json.parse("[3, 4, 5]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "contains [g1] contains keyword with const keyword - array with two items 5 is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 5}}",
  )
  let data = @json.parse("[3, 4, 5, 5]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "contains [g1] contains keyword with const keyword - array without item 5 is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 5}}",
  )
  let data = @json.parse("[1, 2, 3, 4]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "contains [g2] contains keyword with boolean schema true - any non-empty array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": true}",
  )
  let data = @json.parse("[\"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "contains [g2] contains keyword with boolean schema true - empty array is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": true}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "contains [g3] contains keyword with boolean schema false - any non-empty array is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": false}",
  )
  let data = @json.parse("[\"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "contains [g3] contains keyword with boolean schema false - empty array is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": false}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "contains [g3] contains keyword with boolean schema false - non-arrays are valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": false}",
  )
  let data = @json.parse("\"contains does not apply to strings\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "contains [g4] items + contains - matches items, does not match contains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": {\"multipleOf\": 2}, \"contains\": {\"multipleOf\": 3}}",
  )
  let data = @json.parse("[2, 4, 8]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "contains [g4] items + contains - does not match items, matches contains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": {\"multipleOf\": 2}, \"contains\": {\"multipleOf\": 3}}",
  )
  let data = @json.parse("[3, 6, 9]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "contains [g4] items + contains - matches both items and contains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": {\"multipleOf\": 2}, \"contains\": {\"multipleOf\": 3}}",
  )
  let data = @json.parse("[6, 12]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "contains [g4] items + contains - matches neither items nor contains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": {\"multipleOf\": 2}, \"contains\": {\"multipleOf\": 3}}",
  )
  let data = @json.parse("[1, 5]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "contains [g5] contains with false if subschema - any non-empty array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"if\": false, \"else\": true}}",
  )
  let data = @json.parse("[\"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "contains [g5] contains with false if subschema - empty array is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"if\": false, \"else\": true}}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "contains [g6] contains with null instance elements - allows null items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"type\": \"null\"}}",
  )
  let data = @json.parse("[null]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
