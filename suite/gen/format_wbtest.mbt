// Generated from JSON-Schema-Test-Suite tests/draft2020-12/format.json
// (vendored copy in suite/fixtures/format.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "format [g0] email format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"email\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g0] email format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"email\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g0] email format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"email\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g0] email format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"email\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g0] email format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"email\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g0] email format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"email\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g0] email format - invalid email string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"email\"}",
  )
  let data = @json.parse("\"2962\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g1] idn-email format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"idn-email\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g1] idn-email format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"idn-email\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g1] idn-email format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"idn-email\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g1] idn-email format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"idn-email\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g1] idn-email format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"idn-email\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g1] idn-email format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"idn-email\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g1] idn-email format - invalid idn-email string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"idn-email\"}",
  )
  let data = @json.parse("\"2962\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g2] regex format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"regex\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g2] regex format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"regex\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g2] regex format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"regex\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g2] regex format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"regex\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g2] regex format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"regex\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g2] regex format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"regex\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g2] regex format - invalid regex string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"regex\"}",
  )
  let data = @json.parse("\"^(abc]\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g3] ipv4 format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"ipv4\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g3] ipv4 format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"ipv4\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g3] ipv4 format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"ipv4\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g3] ipv4 format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"ipv4\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g3] ipv4 format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"ipv4\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g3] ipv4 format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"ipv4\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g3] ipv4 format - invalid ipv4 string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"ipv4\"}",
  )
  let data = @json.parse("\"127.0.0.0.1\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g4] ipv6 format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"ipv6\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g4] ipv6 format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"ipv6\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g4] ipv6 format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"ipv6\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g4] ipv6 format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"ipv6\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g4] ipv6 format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"ipv6\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g4] ipv6 format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"ipv6\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g4] ipv6 format - invalid ipv6 string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"ipv6\"}",
  )
  let data = @json.parse("\"12345::\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g5] idn-hostname format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"idn-hostname\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g5] idn-hostname format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"idn-hostname\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g5] idn-hostname format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"idn-hostname\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g5] idn-hostname format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"idn-hostname\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g5] idn-hostname format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"idn-hostname\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g5] idn-hostname format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"idn-hostname\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g5] idn-hostname format - invalid idn-hostname string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"idn-hostname\"}",
  )
  let data = @json.parse("\"〮실례.테스트\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g6] hostname format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"hostname\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g6] hostname format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"hostname\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g6] hostname format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"hostname\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g6] hostname format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"hostname\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g6] hostname format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"hostname\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g6] hostname format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"hostname\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g6] hostname format - invalid hostname string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"hostname\"}",
  )
  let data = @json.parse("\"-a-host-name-that-starts-with--\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g7] date format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"date\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g7] date format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"date\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g7] date format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"date\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g7] date format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"date\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g7] date format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"date\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g7] date format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"date\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g7] date format - invalid date string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"date\"}",
  )
  let data = @json.parse("\"06/19/1963\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g8] date-time format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"date-time\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g8] date-time format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"date-time\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g8] date-time format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"date-time\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g8] date-time format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"date-time\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g8] date-time format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"date-time\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g8] date-time format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"date-time\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g8] date-time format - invalid date-time string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"date-time\"}",
  )
  let data = @json.parse("\"1990-02-31T15:59:60.123-08:00\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g9] time format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"time\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g9] time format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"time\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g9] time format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"time\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g9] time format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"time\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g9] time format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"time\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g9] time format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"time\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g9] time format - invalid time string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"time\"}",
  )
  let data = @json.parse("\"08:30:06 PST\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g10] json-pointer format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"json-pointer\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g10] json-pointer format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"json-pointer\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g10] json-pointer format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"json-pointer\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g10] json-pointer format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"json-pointer\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g10] json-pointer format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"json-pointer\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g10] json-pointer format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"json-pointer\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g10] json-pointer format - invalid json-pointer string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"json-pointer\"}",
  )
  let data = @json.parse("\"/foo/bar~\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g11] relative-json-pointer format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"relative-json-pointer\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g11] relative-json-pointer format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"relative-json-pointer\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g11] relative-json-pointer format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"relative-json-pointer\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g11] relative-json-pointer format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"relative-json-pointer\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g11] relative-json-pointer format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"relative-json-pointer\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g11] relative-json-pointer format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"relative-json-pointer\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g11] relative-json-pointer format - invalid relative-json-pointer string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"relative-json-pointer\"}",
  )
  let data = @json.parse("\"/foo/bar\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g12] iri format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"iri\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g12] iri format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"iri\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g12] iri format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"iri\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g12] iri format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"iri\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g12] iri format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"iri\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g12] iri format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"iri\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g12] iri format - invalid iri string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"iri\"}",
  )
  let data = @json.parse("\"http://2001:0db8:85a3:0000:0000:8a2e:0370:7334\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g13] iri-reference format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"iri-reference\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g13] iri-reference format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"iri-reference\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g13] iri-reference format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"iri-reference\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g13] iri-reference format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"iri-reference\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g13] iri-reference format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"iri-reference\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g13] iri-reference format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"iri-reference\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g13] iri-reference format - invalid iri-reference string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"iri-reference\"}",
  )
  let data = @json.parse("\"\\\\\\\\WINDOWS\\\\filëßåré\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g14] uri format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g14] uri format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g14] uri format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g14] uri format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g14] uri format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g14] uri format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g14] uri format - invalid uri string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri\"}",
  )
  let data = @json.parse("\"//foo.bar/?baz=qux#quux\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g15] uri-reference format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri-reference\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g15] uri-reference format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri-reference\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g15] uri-reference format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri-reference\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g15] uri-reference format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri-reference\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g15] uri-reference format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri-reference\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g15] uri-reference format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri-reference\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g15] uri-reference format - invalid uri-reference string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri-reference\"}",
  )
  let data = @json.parse("\"\\\\\\\\WINDOWS\\\\fileshare\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g16] uri-template format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri-template\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g16] uri-template format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri-template\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g16] uri-template format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri-template\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g16] uri-template format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri-template\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g16] uri-template format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri-template\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g16] uri-template format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri-template\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g16] uri-template format - invalid uri-template string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uri-template\"}",
  )
  let data = @json.parse("\"http://example.com/dictionary/{term:1}/{term\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g17] uuid format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uuid\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g17] uuid format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uuid\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g17] uuid format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uuid\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g17] uuid format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uuid\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g17] uuid format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uuid\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g17] uuid format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uuid\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g17] uuid format - invalid uuid string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"uuid\"}",
  )
  let data = @json.parse("\"2eb8aa08-aa98-11ea-b4aa-73b441d1638\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g18] duration format - all string formats ignore integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"duration\"}",
  )
  let data = @json.parse("12")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g18] duration format - all string formats ignore floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"duration\"}",
  )
  let data = @json.parse("13.7")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g18] duration format - all string formats ignore objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"duration\"}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g18] duration format - all string formats ignore arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"duration\"}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g18] duration format - all string formats ignore booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"duration\"}",
  )
  let data = @json.parse("false")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g18] duration format - all string formats ignore nulls" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"duration\"}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "format [g18] duration format - invalid duration string is only an annotation by default" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"format\": \"duration\"}",
  )
  let data = @json.parse("\"PT1D\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
