// Generated from JSON-Schema-Test-Suite tests/draft2020-12/multipleOf.json
// (vendored copy in suite/fixtures/multipleOf.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "multipleOf [g0] by int - int by int" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"multipleOf\": 2}",
  )
  let data = @json.parse("10")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "multipleOf [g0] by int - int by int fail" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"multipleOf\": 2}",
  )
  let data = @json.parse("7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "multipleOf [g0] by int - ignores non-numbers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"multipleOf\": 2}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "multipleOf [g1] by number - zero is multiple of anything" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"multipleOf\": 1.5}",
  )
  let data = @json.parse("0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "multipleOf [g1] by number - 4.5 is multiple of 1.5" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"multipleOf\": 1.5}",
  )
  let data = @json.parse("4.5")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "multipleOf [g1] by number - -4.5 is multiple of 1.5" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"multipleOf\": 1.5}",
  )
  let data = @json.parse("-4.5")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "multipleOf [g1] by number - 35 is not multiple of 1.5" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"multipleOf\": 1.5}",
  )
  let data = @json.parse("35")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "multipleOf [g2] by small number - 0.0075 is multiple of 0.0001" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"multipleOf\": 0.0001}",
  )
  let data = @json.parse("0.0075")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "multipleOf [g2] by small number - 0.00751 is not multiple of 0.0001" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"multipleOf\": 0.0001}",
  )
  let data = @json.parse("0.00751")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "multipleOf [g3] float division = inf - always invalid, but naive implementations may raise an overflow error" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"integer\", \"multipleOf\": 0.123456789}",
  )
  let data = @json.parse("1e+308")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "multipleOf [g4] small multiple of large integer - any integer is a multiple of 1e-8" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"integer\", \"multipleOf\": 1e-08}",
  )
  let data = @json.parse("12391239123")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
