// Generated from JSON-Schema-Test-Suite tests/draft2020-12/minContains.json
// (vendored copy in suite/fixtures/minContains.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "minContains [g0] minContains without contains is ignored - one item valid against lone minContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minContains\": 1}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minContains [g0] minContains without contains is ignored - zero items still valid against lone minContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"minContains\": 1}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minContains [g1] minContains=1 with contains - empty data" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 1}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minContains [g1] minContains=1 with contains - no elements match" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 1}",
  )
  let data = @json.parse("[2]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minContains [g1] minContains=1 with contains - single element matches, valid minContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 1}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minContains [g1] minContains=1 with contains - some elements match, valid minContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 1}",
  )
  let data = @json.parse("[1, 2]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minContains [g1] minContains=1 with contains - all elements match, valid minContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 1}",
  )
  let data = @json.parse("[1, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minContains [g2] minContains=2 with contains - empty data" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 2}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minContains [g2] minContains=2 with contains - all elements match, invalid minContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 2}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minContains [g2] minContains=2 with contains - some elements match, invalid minContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 2}",
  )
  let data = @json.parse("[1, 2]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minContains [g2] minContains=2 with contains - all elements match, valid minContains (exactly as needed)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 2}",
  )
  let data = @json.parse("[1, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minContains [g2] minContains=2 with contains - all elements match, valid minContains (more than needed)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 2}",
  )
  let data = @json.parse("[1, 1, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minContains [g2] minContains=2 with contains - some elements match, valid minContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 2}",
  )
  let data = @json.parse("[1, 2, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minContains [g3] minContains=2 with contains with a decimal value - one element matches, invalid minContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 2.0}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minContains [g3] minContains=2 with contains with a decimal value - both elements match, valid minContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 2.0}",
  )
  let data = @json.parse("[1, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minContains [g4] maxContains = minContains - empty data" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"maxContains\": 2, \"minContains\": 2}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minContains [g4] maxContains = minContains - all elements match, invalid minContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"maxContains\": 2, \"minContains\": 2}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minContains [g4] maxContains = minContains - all elements match, invalid maxContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"maxContains\": 2, \"minContains\": 2}",
  )
  let data = @json.parse("[1, 1, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minContains [g4] maxContains = minContains - all elements match, valid maxContains and minContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"maxContains\": 2, \"minContains\": 2}",
  )
  let data = @json.parse("[1, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minContains [g5] maxContains < minContains - empty data" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"maxContains\": 1, \"minContains\": 3}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minContains [g5] maxContains < minContains - invalid minContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"maxContains\": 1, \"minContains\": 3}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minContains [g5] maxContains < minContains - invalid maxContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"maxContains\": 1, \"minContains\": 3}",
  )
  let data = @json.parse("[1, 1, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minContains [g5] maxContains < minContains - invalid maxContains and minContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"maxContains\": 1, \"minContains\": 3}",
  )
  let data = @json.parse("[1, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "minContains [g6] minContains = 0 - empty data" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 0}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minContains [g6] minContains = 0 - minContains = 0 makes contains always pass" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 0}",
  )
  let data = @json.parse("[2]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minContains [g7] minContains = 0 with maxContains - empty data" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 0, \"maxContains\": 1}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minContains [g7] minContains = 0 with maxContains - not more than maxContains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 0, \"maxContains\": 1}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "minContains [g7] minContains = 0 with maxContains - too many" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"const\": 1}, \"minContains\": 0, \"maxContains\": 1}",
  )
  let data = @json.parse("[1, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
