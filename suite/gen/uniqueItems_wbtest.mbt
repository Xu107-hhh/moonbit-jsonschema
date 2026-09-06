// Generated from JSON-Schema-Test-Suite tests/draft2020-12/uniqueItems.json
// (vendored copy in suite/fixtures/uniqueItems.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "uniqueItems [g0] uniqueItems validation - unique array of integers is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[1, 2]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - non-unique array of integers is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[1, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - non-unique array of more than two integers is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[1, 2, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - numbers are unique if mathematically unequal" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[1.0, 1.0, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - false is not equal to zero" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[0, false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - true is not equal to one" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[1, true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - unique array of strings is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[\"foo\", \"bar\", \"baz\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - non-unique array of strings is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[\"foo\", \"bar\", \"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - unique array of objects is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[{\"foo\": \"bar\"}, {\"foo\": \"baz\"}]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - non-unique array of objects is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[{\"foo\": \"bar\"}, {\"foo\": \"bar\"}]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - property order of array of objects is ignored" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse(
    "[{\"foo\": \"bar\", \"bar\": \"foo\"}, {\"bar\": \"foo\", \"foo\": \"bar\"}]",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - unique array of nested objects is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse(
    "[{\"foo\": {\"bar\": {\"baz\": true}}}, {\"foo\": {\"bar\": {\"baz\": false}}}]",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - non-unique array of nested objects is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse(
    "[{\"foo\": {\"bar\": {\"baz\": true}}}, {\"foo\": {\"bar\": {\"baz\": true}}}]",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - unique array of arrays is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[[\"foo\"], [\"bar\"]]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - non-unique array of arrays is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[[\"foo\"], [\"foo\"]]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - non-unique array of more than two arrays is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[[\"foo\"], [\"bar\"], [\"foo\"]]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - 1 and true are unique" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[1, true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - 0 and false are unique" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[0, false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - [1] and [true] are unique" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[[1], [true]]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - [0] and [false] are unique" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[[0], [false]]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - nested [1] and [true] are unique" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[[[1], \"foo\"], [[true], \"foo\"]]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - nested [0] and [false] are unique" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[[[0], \"foo\"], [[false], \"foo\"]]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - unique heterogeneous types are valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[{}, [1], true, null, 1, \"{}\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - non-unique heterogeneous types are invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[{}, [1], true, null, {}, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - different objects are unique" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[{\"a\": 1, \"b\": 2}, {\"a\": 2, \"b\": 1}]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - objects are non-unique despite key order" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[{\"a\": 1, \"b\": 2}, {\"b\": 2, \"a\": 1}]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - {'a': false} and {'a': 0} are unique" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[{\"a\": false}, {\"a\": 0}]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g0] uniqueItems validation - {'a': true} and {'a': 1} are unique" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": true}",
  )
  let data = @json.parse("[{\"a\": true}, {\"a\": 1}]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g1] uniqueItems with an array of items - [false, true] from items array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": true}",
  )
  let data = @json.parse("[false, true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g1] uniqueItems with an array of items - [true, false] from items array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": true}",
  )
  let data = @json.parse("[true, false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g1] uniqueItems with an array of items - [false, false] from items array is not valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": true}",
  )
  let data = @json.parse("[false, false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g1] uniqueItems with an array of items - [true, true] from items array is not valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": true}",
  )
  let data = @json.parse("[true, true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g1] uniqueItems with an array of items - unique array extended from [false, true] is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": true}",
  )
  let data = @json.parse("[false, true, \"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g1] uniqueItems with an array of items - unique array extended from [true, false] is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": true}",
  )
  let data = @json.parse("[true, false, \"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g1] uniqueItems with an array of items - non-unique array extended from [false, true] is not valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": true}",
  )
  let data = @json.parse("[false, true, \"foo\", \"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g1] uniqueItems with an array of items - non-unique array extended from [true, false] is not valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": true}",
  )
  let data = @json.parse("[true, false, \"foo\", \"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g2] uniqueItems with an array of items and additionalItems=false - [false, true] from items array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": true, \"items\": false}",
  )
  let data = @json.parse("[false, true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g2] uniqueItems with an array of items and additionalItems=false - [true, false] from items array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": true, \"items\": false}",
  )
  let data = @json.parse("[true, false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g2] uniqueItems with an array of items and additionalItems=false - [false, false] from items array is not valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": true, \"items\": false}",
  )
  let data = @json.parse("[false, false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g2] uniqueItems with an array of items and additionalItems=false - [true, true] from items array is not valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": true, \"items\": false}",
  )
  let data = @json.parse("[true, true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g2] uniqueItems with an array of items and additionalItems=false - extra items are invalid even if unique" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": true, \"items\": false}",
  )
  let data = @json.parse("[false, true, null]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "uniqueItems [g3] uniqueItems=false validation - unique array of integers is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": false}",
  )
  let data = @json.parse("[1, 2]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g3] uniqueItems=false validation - non-unique array of integers is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": false}",
  )
  let data = @json.parse("[1, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g3] uniqueItems=false validation - numbers are unique if mathematically unequal" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": false}",
  )
  let data = @json.parse("[1.0, 1.0, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g3] uniqueItems=false validation - false is not equal to zero" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": false}",
  )
  let data = @json.parse("[0, false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g3] uniqueItems=false validation - true is not equal to one" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": false}",
  )
  let data = @json.parse("[1, true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g3] uniqueItems=false validation - unique array of objects is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": false}",
  )
  let data = @json.parse("[{\"foo\": \"bar\"}, {\"foo\": \"baz\"}]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g3] uniqueItems=false validation - non-unique array of objects is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": false}",
  )
  let data = @json.parse("[{\"foo\": \"bar\"}, {\"foo\": \"bar\"}]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g3] uniqueItems=false validation - unique array of nested objects is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": false}",
  )
  let data = @json.parse(
    "[{\"foo\": {\"bar\": {\"baz\": true}}}, {\"foo\": {\"bar\": {\"baz\": false}}}]",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g3] uniqueItems=false validation - non-unique array of nested objects is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": false}",
  )
  let data = @json.parse(
    "[{\"foo\": {\"bar\": {\"baz\": true}}}, {\"foo\": {\"bar\": {\"baz\": true}}}]",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g3] uniqueItems=false validation - unique array of arrays is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": false}",
  )
  let data = @json.parse("[[\"foo\"], [\"bar\"]]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g3] uniqueItems=false validation - non-unique array of arrays is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": false}",
  )
  let data = @json.parse("[[\"foo\"], [\"foo\"]]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g3] uniqueItems=false validation - 1 and true are unique" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": false}",
  )
  let data = @json.parse("[1, true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g3] uniqueItems=false validation - 0 and false are unique" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": false}",
  )
  let data = @json.parse("[0, false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g3] uniqueItems=false validation - unique heterogeneous types are valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": false}",
  )
  let data = @json.parse("[{}, [1], true, null, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g3] uniqueItems=false validation - non-unique heterogeneous types are valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"uniqueItems\": false}",
  )
  let data = @json.parse("[{}, [1], true, null, {}, 1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g4] uniqueItems=false with an array of items - [false, true] from items array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": false}",
  )
  let data = @json.parse("[false, true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g4] uniqueItems=false with an array of items - [true, false] from items array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": false}",
  )
  let data = @json.parse("[true, false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g4] uniqueItems=false with an array of items - [false, false] from items array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": false}",
  )
  let data = @json.parse("[false, false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g4] uniqueItems=false with an array of items - [true, true] from items array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": false}",
  )
  let data = @json.parse("[true, true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g4] uniqueItems=false with an array of items - unique array extended from [false, true] is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": false}",
  )
  let data = @json.parse("[false, true, \"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g4] uniqueItems=false with an array of items - unique array extended from [true, false] is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": false}",
  )
  let data = @json.parse("[true, false, \"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g4] uniqueItems=false with an array of items - non-unique array extended from [false, true] is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": false}",
  )
  let data = @json.parse("[false, true, \"foo\", \"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g4] uniqueItems=false with an array of items - non-unique array extended from [true, false] is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": false}",
  )
  let data = @json.parse("[true, false, \"foo\", \"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g5] uniqueItems=false with an array of items and additionalItems=false - [false, true] from items array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": false, \"items\": false}",
  )
  let data = @json.parse("[false, true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g5] uniqueItems=false with an array of items and additionalItems=false - [true, false] from items array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": false, \"items\": false}",
  )
  let data = @json.parse("[true, false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g5] uniqueItems=false with an array of items and additionalItems=false - [false, false] from items array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": false, \"items\": false}",
  )
  let data = @json.parse("[false, false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g5] uniqueItems=false with an array of items and additionalItems=false - [true, true] from items array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": false, \"items\": false}",
  )
  let data = @json.parse("[true, true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "uniqueItems [g5] uniqueItems=false with an array of items and additionalItems=false - extra items are invalid even if unique" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"boolean\"}, {\"type\": \"boolean\"}], \"uniqueItems\": false, \"items\": false}",
  )
  let data = @json.parse("[false, true, null]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
