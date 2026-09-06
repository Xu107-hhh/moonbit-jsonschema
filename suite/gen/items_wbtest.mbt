// Generated from JSON-Schema-Test-Suite tests/draft2020-12/items.json
// (vendored copy in suite/fixtures/items.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "items [g0] a schema given for items - valid items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": {\"type\": \"integer\"}}",
  )
  let data = @json.parse("[1, 2, 3]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g0] a schema given for items - wrong type of items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": {\"type\": \"integer\"}}",
  )
  let data = @json.parse("[1, \"x\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "items [g0] a schema given for items - ignores non-arrays" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": {\"type\": \"integer\"}}",
  )
  let data = @json.parse("{\"foo\": \"bar\"}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g0] a schema given for items - JavaScript pseudo-array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": {\"type\": \"integer\"}}",
  )
  let data = @json.parse("{\"0\": \"invalid\", \"length\": 1}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g1] items with boolean schema (true) - any array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": true}",
  )
  let data = @json.parse("[1, \"foo\", true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g1] items with boolean schema (true) - empty array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": true}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g2] items with boolean schema (false) - any non-empty array is invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": false}",
  )
  let data = @json.parse("[1, \"foo\", true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "items [g2] items with boolean schema (false) - empty array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": false}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g3] items and subitems - valid items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"item\": {\"type\": \"array\", \"items\": false, \"prefixItems\": [{\"$ref\": \"#/$defs/sub-item\"}, {\"$ref\": \"#/$defs/sub-item\"}]}, \"sub-item\": {\"type\": \"object\", \"required\": [\"foo\"]}}, \"type\": \"array\", \"items\": false, \"prefixItems\": [{\"$ref\": \"#/$defs/item\"}, {\"$ref\": \"#/$defs/item\"}, {\"$ref\": \"#/$defs/item\"}]}",
  )
  let data = @json.parse(
    "[[{\"foo\": null}, {\"foo\": null}], [{\"foo\": null}, {\"foo\": null}], [{\"foo\": null}, {\"foo\": null}]]",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g3] items and subitems - too many items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"item\": {\"type\": \"array\", \"items\": false, \"prefixItems\": [{\"$ref\": \"#/$defs/sub-item\"}, {\"$ref\": \"#/$defs/sub-item\"}]}, \"sub-item\": {\"type\": \"object\", \"required\": [\"foo\"]}}, \"type\": \"array\", \"items\": false, \"prefixItems\": [{\"$ref\": \"#/$defs/item\"}, {\"$ref\": \"#/$defs/item\"}, {\"$ref\": \"#/$defs/item\"}]}",
  )
  let data = @json.parse(
    "[[{\"foo\": null}, {\"foo\": null}], [{\"foo\": null}, {\"foo\": null}], [{\"foo\": null}, {\"foo\": null}], [{\"foo\": null}, {\"foo\": null}]]",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "items [g3] items and subitems - too many sub-items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"item\": {\"type\": \"array\", \"items\": false, \"prefixItems\": [{\"$ref\": \"#/$defs/sub-item\"}, {\"$ref\": \"#/$defs/sub-item\"}]}, \"sub-item\": {\"type\": \"object\", \"required\": [\"foo\"]}}, \"type\": \"array\", \"items\": false, \"prefixItems\": [{\"$ref\": \"#/$defs/item\"}, {\"$ref\": \"#/$defs/item\"}, {\"$ref\": \"#/$defs/item\"}]}",
  )
  let data = @json.parse(
    "[[{\"foo\": null}, {\"foo\": null}, {\"foo\": null}], [{\"foo\": null}, {\"foo\": null}], [{\"foo\": null}, {\"foo\": null}]]",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "items [g3] items and subitems - wrong item" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"item\": {\"type\": \"array\", \"items\": false, \"prefixItems\": [{\"$ref\": \"#/$defs/sub-item\"}, {\"$ref\": \"#/$defs/sub-item\"}]}, \"sub-item\": {\"type\": \"object\", \"required\": [\"foo\"]}}, \"type\": \"array\", \"items\": false, \"prefixItems\": [{\"$ref\": \"#/$defs/item\"}, {\"$ref\": \"#/$defs/item\"}, {\"$ref\": \"#/$defs/item\"}]}",
  )
  let data = @json.parse(
    "[{\"foo\": null}, [{\"foo\": null}, {\"foo\": null}], [{\"foo\": null}, {\"foo\": null}]]",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "items [g3] items and subitems - wrong sub-item" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"item\": {\"type\": \"array\", \"items\": false, \"prefixItems\": [{\"$ref\": \"#/$defs/sub-item\"}, {\"$ref\": \"#/$defs/sub-item\"}]}, \"sub-item\": {\"type\": \"object\", \"required\": [\"foo\"]}}, \"type\": \"array\", \"items\": false, \"prefixItems\": [{\"$ref\": \"#/$defs/item\"}, {\"$ref\": \"#/$defs/item\"}, {\"$ref\": \"#/$defs/item\"}]}",
  )
  let data = @json.parse(
    "[[{}, {\"foo\": null}], [{\"foo\": null}, {\"foo\": null}], [{\"foo\": null}, {\"foo\": null}]]",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "items [g3] items and subitems - fewer items is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"item\": {\"type\": \"array\", \"items\": false, \"prefixItems\": [{\"$ref\": \"#/$defs/sub-item\"}, {\"$ref\": \"#/$defs/sub-item\"}]}, \"sub-item\": {\"type\": \"object\", \"required\": [\"foo\"]}}, \"type\": \"array\", \"items\": false, \"prefixItems\": [{\"$ref\": \"#/$defs/item\"}, {\"$ref\": \"#/$defs/item\"}, {\"$ref\": \"#/$defs/item\"}]}",
  )
  let data = @json.parse("[[{\"foo\": null}], [{\"foo\": null}]]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g4] nested items - valid nested array" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"array\", \"items\": {\"type\": \"array\", \"items\": {\"type\": \"array\", \"items\": {\"type\": \"array\", \"items\": {\"type\": \"number\"}}}}}",
  )
  let data = @json.parse("[[[[1]], [[2], [3]]], [[[4], [5], [6]]]]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g4] nested items - nested array with invalid type" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"array\", \"items\": {\"type\": \"array\", \"items\": {\"type\": \"array\", \"items\": {\"type\": \"array\", \"items\": {\"type\": \"number\"}}}}}",
  )
  let data = @json.parse("[[[[\"1\"]], [[2], [3]]], [[[4], [5], [6]]]]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "items [g4] nested items - not deep enough" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"array\", \"items\": {\"type\": \"array\", \"items\": {\"type\": \"array\", \"items\": {\"type\": \"array\", \"items\": {\"type\": \"number\"}}}}}",
  )
  let data = @json.parse("[[[1], [2], [3]], [[4], [5], [6]]]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "items [g5] prefixItems with no additional items allowed - empty array" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{}, {}, {}], \"items\": false}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g5] prefixItems with no additional items allowed - fewer number of items present (1)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{}, {}, {}], \"items\": false}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g5] prefixItems with no additional items allowed - fewer number of items present (2)" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{}, {}, {}], \"items\": false}",
  )
  let data = @json.parse("[1, 2]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g5] prefixItems with no additional items allowed - equal number of items present" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{}, {}, {}], \"items\": false}",
  )
  let data = @json.parse("[1, 2, 3]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g5] prefixItems with no additional items allowed - additional items are not permitted" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{}, {}, {}], \"items\": false}",
  )
  let data = @json.parse("[1, 2, 3, 4]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "items [g6] items does not look in applicators, valid case - prefixItems in allOf does not constrain items, invalid case" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"prefixItems\": [{\"minimum\": 3}]}], \"items\": {\"minimum\": 5}}",
  )
  let data = @json.parse("[3, 5]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "items [g6] items does not look in applicators, valid case - prefixItems in allOf does not constrain items, valid case" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"prefixItems\": [{\"minimum\": 3}]}], \"items\": {\"minimum\": 5}}",
  )
  let data = @json.parse("[5, 5]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g7] prefixItems validation adjusts the starting index for items - valid items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"string\"}], \"items\": {\"type\": \"integer\"}}",
  )
  let data = @json.parse("[\"x\", 2, 3]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g7] prefixItems validation adjusts the starting index for items - wrong type of second item" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"string\"}], \"items\": {\"type\": \"integer\"}}",
  )
  let data = @json.parse("[\"x\", \"y\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "items [g8] items with heterogeneous array - heterogeneous invalid instance" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{}], \"items\": false}",
  )
  let data = @json.parse("[\"foo\", \"bar\", 37]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "items [g8] items with heterogeneous array - valid instance" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{}], \"items\": false}",
  )
  let data = @json.parse("[null]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "items [g9] items with null instance elements - allows null elements" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": {\"type\": \"null\"}}",
  )
  let data = @json.parse("[null]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
