// Generated from JSON-Schema-Test-Suite tests/draft2020-12/maxContains.json
// (vendored copy in suite/fixtures/maxContains.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "maxContains [g0] maxContains without contains is ignored - one item valid against lone maxContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxContains\": 1}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxContains [g0] maxContains without contains is ignored - two items still valid against lone maxContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"maxContains\": 1}",
  )
  let data = @json.parse("[1, 2]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxContains [g1] maxContains with contains - empty data" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"maxContains\": 1}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "maxContains [g1] maxContains with contains - all elements match, valid maxContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"maxContains\": 1}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxContains [g1] maxContains with contains - all elements match, invalid maxContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"maxContains\": 1}",
  )
  let data = @json.parse("[1, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "maxContains [g1] maxContains with contains - some elements match, valid maxContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"maxContains\": 1}",
  )
  let data = @json.parse("[1, 2]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxContains [g1] maxContains with contains - some elements match, invalid maxContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"maxContains\": 1}",
  )
  let data = @json.parse("[1, 2, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "maxContains [g2] maxContains with contains, value with a decimal - one element matches, valid maxContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"maxContains\": 1.0}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxContains [g2] maxContains with contains, value with a decimal - too many elements match, invalid maxContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"maxContains\": 1.0}",
  )
  let data = @json.parse("[1, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "maxContains [g3] minContains < maxContains - actual < minContains < maxContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 1, \"maxContains\": 3}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "maxContains [g3] minContains < maxContains - minContains < actual < maxContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 1, \"maxContains\": 3}",
  )
  let data = @json.parse("[1, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxContains [g3] minContains < maxContains - minContains < maxContains < actual" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 1, \"maxContains\": 3}",
  )
  let data = @json.parse("[1, 1, 1, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "maxContains [g4] maxContains = 0 with minContains = 0 - empty array" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 0, \"maxContains\": 0}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "maxContains [g4] maxContains = 0 with minContains = 0 - one matching item" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 0, \"maxContains\": 0}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
