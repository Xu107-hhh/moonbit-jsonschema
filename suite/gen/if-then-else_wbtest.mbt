// Generated from JSON-Schema-Test-Suite tests/draft2020-12/if-then-else.json
// (vendored copy in suite/fixtures/if-then-else.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "if-then-else [g0] ignore if without then or else - valid when valid against lone if" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"const\": 0}}",
  )
  let data = @json.parse("0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g0] ignore if without then or else - valid when invalid against lone if" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"const\": 0}}",
  )
  let data = @json.parse("\"hello\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g1] ignore then without if - valid when valid against lone then" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"then\": {\"const\": 0}}",
  )
  let data = @json.parse("0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g1] ignore then without if - valid when invalid against lone then" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"then\": {\"const\": 0}}",
  )
  let data = @json.parse("\"hello\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g2] ignore else without if - valid when valid against lone else" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"else\": {\"const\": 0}}",
  )
  let data = @json.parse("0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g2] ignore else without if - valid when invalid against lone else" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"else\": {\"const\": 0}}",
  )
  let data = @json.parse("\"hello\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g3] if and then without else - valid through then" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"exclusiveMaximum\": 0}, \"then\": {\"minimum\": -10}}",
  )
  let data = @json.parse("-1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g3] if and then without else - invalid through then" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"exclusiveMaximum\": 0}, \"then\": {\"minimum\": -10}}",
  )
  let data = @json.parse("-100")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "if-then-else [g3] if and then without else - valid when if test fails" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"exclusiveMaximum\": 0}, \"then\": {\"minimum\": -10}}",
  )
  let data = @json.parse("3")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g4] if and else without then - valid when if test passes" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"exclusiveMaximum\": 0}, \"else\": {\"multipleOf\": 2}}",
  )
  let data = @json.parse("-1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g4] if and else without then - valid through else" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"exclusiveMaximum\": 0}, \"else\": {\"multipleOf\": 2}}",
  )
  let data = @json.parse("4")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g4] if and else without then - invalid through else" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"exclusiveMaximum\": 0}, \"else\": {\"multipleOf\": 2}}",
  )
  let data = @json.parse("3")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "if-then-else [g5] validate against correct branch, then vs else - valid through then" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"exclusiveMaximum\": 0}, \"then\": {\"minimum\": -10}, \"else\": {\"multipleOf\": 2}}",
  )
  let data = @json.parse("-1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g5] validate against correct branch, then vs else - invalid through then" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"exclusiveMaximum\": 0}, \"then\": {\"minimum\": -10}, \"else\": {\"multipleOf\": 2}}",
  )
  let data = @json.parse("-100")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "if-then-else [g5] validate against correct branch, then vs else - valid through else" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"exclusiveMaximum\": 0}, \"then\": {\"minimum\": -10}, \"else\": {\"multipleOf\": 2}}",
  )
  let data = @json.parse("4")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g5] validate against correct branch, then vs else - invalid through else" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"exclusiveMaximum\": 0}, \"then\": {\"minimum\": -10}, \"else\": {\"multipleOf\": 2}}",
  )
  let data = @json.parse("3")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "if-then-else [g6] non-interference across combined schemas - valid, but would have been invalid through then" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"if\": {\"exclusiveMaximum\": 0}}, {\"then\": {\"minimum\": -10}}, {\"else\": {\"multipleOf\": 2}}]}",
  )
  let data = @json.parse("-100")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g6] non-interference across combined schemas - valid, but would have been invalid through else" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"if\": {\"exclusiveMaximum\": 0}}, {\"then\": {\"minimum\": -10}}, {\"else\": {\"multipleOf\": 2}}]}",
  )
  let data = @json.parse("3")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g7] if with boolean schema true - boolean schema true in if always chooses the then path (valid)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": true, \"then\": {\"const\": \"then\"}, \"else\": {\"const\": \"else\"}}",
  )
  let data = @json.parse("\"then\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g7] if with boolean schema true - boolean schema true in if always chooses the then path (invalid)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": true, \"then\": {\"const\": \"then\"}, \"else\": {\"const\": \"else\"}}",
  )
  let data = @json.parse("\"else\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "if-then-else [g8] if with boolean schema false - boolean schema false in if always chooses the else path (invalid)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": false, \"then\": {\"const\": \"then\"}, \"else\": {\"const\": \"else\"}}",
  )
  let data = @json.parse("\"then\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "if-then-else [g8] if with boolean schema false - boolean schema false in if always chooses the else path (valid)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": false, \"then\": {\"const\": \"then\"}, \"else\": {\"const\": \"else\"}}",
  )
  let data = @json.parse("\"else\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g9] if appears at the end when serialized (keyword processing sequence) - yes redirects to then and passes" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"then\": {\"const\": \"yes\"}, \"else\": {\"const\": \"other\"}, \"if\": {\"maxLength\": 4}}",
  )
  let data = @json.parse("\"yes\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g9] if appears at the end when serialized (keyword processing sequence) - other redirects to else and passes" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"then\": {\"const\": \"yes\"}, \"else\": {\"const\": \"other\"}, \"if\": {\"maxLength\": 4}}",
  )
  let data = @json.parse("\"other\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g9] if appears at the end when serialized (keyword processing sequence) - no redirects to then and fails" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"then\": {\"const\": \"yes\"}, \"else\": {\"const\": \"other\"}, \"if\": {\"maxLength\": 4}}",
  )
  let data = @json.parse("\"no\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "if-then-else [g9] if appears at the end when serialized (keyword processing sequence) - invalid redirects to else and fails" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"then\": {\"const\": \"yes\"}, \"else\": {\"const\": \"other\"}, \"if\": {\"maxLength\": 4}}",
  )
  let data = @json.parse("\"invalid\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "if-then-else [g10] then: false fails when condition matches - matches if → then=false → invalid" {
  let schema = @json.parse("{\"if\": {\"const\": 1}, \"then\": false}")
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "if-then-else [g10] then: false fails when condition matches - does not match if → then ignored → valid" {
  let schema = @json.parse("{\"if\": {\"const\": 1}, \"then\": false}")
  let data = @json.parse("2")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g11] else: false fails when condition does not match - matches if → else ignored → valid" {
  let schema = @json.parse("{\"if\": {\"const\": 1}, \"else\": false}")
  let data = @json.parse("1")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "if-then-else [g11] else: false fails when condition does not match - does not match if → else executes → invalid" {
  let schema = @json.parse("{\"if\": {\"const\": 1}, \"else\": false}")
  let data = @json.parse("2")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
