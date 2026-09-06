// Generated from JSON-Schema-Test-Suite tests/draft2020-12/unevaluatedItems.json
// (vendored copy in suite/fixtures/unevaluatedItems.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "unevaluatedItems [g0] unevaluatedItems true - with no unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": true}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g0] unevaluatedItems true - with unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": true}",
  )
  let data = @json.parse("[\"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g1] unevaluatedItems false - with no unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g1] unevaluatedItems false - with unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g2] unevaluatedItems as schema - with no unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": {\"type\": \"string\"}}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g2] unevaluatedItems as schema - with valid unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": {\"type\": \"string\"}}",
  )
  let data = @json.parse("[\"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g2] unevaluatedItems as schema - with invalid unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": {\"type\": \"string\"}}",
  )
  let data = @json.parse("[42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g3] unevaluatedItems with uniform items - unevaluatedItems doesn't apply" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": {\"type\": \"string\"}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g4] unevaluatedItems with tuple - with no unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"string\"}], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g4] unevaluatedItems with tuple - with unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"string\"}], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g5] unevaluatedItems with items and prefixItems - unevaluatedItems doesn't apply" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"string\"}], \"items\": true, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", 42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g6] unevaluatedItems with items - valid under items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": {\"type\": \"number\"}, \"unevaluatedItems\": {\"type\": \"string\"}}",
  )
  let data = @json.parse("[5, 6, 7, 8]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g6] unevaluatedItems with items - invalid under items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"items\": {\"type\": \"number\"}, \"unevaluatedItems\": {\"type\": \"string\"}}",
  )
  let data = @json.parse("[\"foo\", \"bar\", \"baz\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g7] unevaluatedItems with nested tuple - with no unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"string\"}], \"allOf\": [{\"prefixItems\": [true, {\"type\": \"number\"}]}], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", 42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g7] unevaluatedItems with nested tuple - with unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"string\"}], \"allOf\": [{\"prefixItems\": [true, {\"type\": \"number\"}]}], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", 42, true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g8] unevaluatedItems with nested items - with only (valid) additional items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": {\"type\": \"boolean\"}, \"anyOf\": [{\"items\": {\"type\": \"string\"}}, true]}",
  )
  let data = @json.parse("[true, false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g8] unevaluatedItems with nested items - with no additional items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": {\"type\": \"boolean\"}, \"anyOf\": [{\"items\": {\"type\": \"string\"}}, true]}",
  )
  let data = @json.parse("[\"yes\", \"no\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g8] unevaluatedItems with nested items - with invalid additional item" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": {\"type\": \"boolean\"}, \"anyOf\": [{\"items\": {\"type\": \"string\"}}, true]}",
  )
  let data = @json.parse("[\"yes\", false]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g9] unevaluatedItems with nested prefixItems and items - with no additional items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"prefixItems\": [{\"type\": \"string\"}], \"items\": true}], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g9] unevaluatedItems with nested prefixItems and items - with additional items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"prefixItems\": [{\"type\": \"string\"}], \"items\": true}], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", 42, true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g10] unevaluatedItems with nested unevaluatedItems - with no additional items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"prefixItems\": [{\"type\": \"string\"}]}, {\"unevaluatedItems\": true}], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g10] unevaluatedItems with nested unevaluatedItems - with additional items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"prefixItems\": [{\"type\": \"string\"}]}, {\"unevaluatedItems\": true}], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", 42, true]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g11] unevaluatedItems with anyOf - when one schema matches and has no unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"const\": \"foo\"}], \"anyOf\": [{\"prefixItems\": [true, {\"const\": \"bar\"}]}, {\"prefixItems\": [true, true, {\"const\": \"baz\"}]}], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g11] unevaluatedItems with anyOf - when one schema matches and has unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"const\": \"foo\"}], \"anyOf\": [{\"prefixItems\": [true, {\"const\": \"bar\"}]}, {\"prefixItems\": [true, true, {\"const\": \"baz\"}]}], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", \"bar\", 42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g11] unevaluatedItems with anyOf - when two schemas match and has no unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"const\": \"foo\"}], \"anyOf\": [{\"prefixItems\": [true, {\"const\": \"bar\"}]}, {\"prefixItems\": [true, true, {\"const\": \"baz\"}]}], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", \"bar\", \"baz\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g11] unevaluatedItems with anyOf - when two schemas match and has unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"const\": \"foo\"}], \"anyOf\": [{\"prefixItems\": [true, {\"const\": \"bar\"}]}, {\"prefixItems\": [true, true, {\"const\": \"baz\"}]}], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", \"bar\", \"baz\", 42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g12] unevaluatedItems with oneOf - with no unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"const\": \"foo\"}], \"oneOf\": [{\"prefixItems\": [true, {\"const\": \"bar\"}]}, {\"prefixItems\": [true, {\"const\": \"baz\"}]}], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g12] unevaluatedItems with oneOf - with unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"const\": \"foo\"}], \"oneOf\": [{\"prefixItems\": [true, {\"const\": \"bar\"}]}, {\"prefixItems\": [true, {\"const\": \"baz\"}]}], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", \"bar\", 42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g13] unevaluatedItems with not - with unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"const\": \"foo\"}], \"not\": {\"not\": {\"prefixItems\": [true, {\"const\": \"bar\"}]}}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g14] unevaluatedItems with if/then/else - when if matches and it has no unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"const\": \"foo\"}], \"if\": {\"prefixItems\": [true, {\"const\": \"bar\"}]}, \"then\": {\"prefixItems\": [true, true, {\"const\": \"then\"}]}, \"else\": {\"prefixItems\": [true, true, true, {\"const\": \"else\"}]}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", \"bar\", \"then\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g14] unevaluatedItems with if/then/else - when if matches and it has unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"const\": \"foo\"}], \"if\": {\"prefixItems\": [true, {\"const\": \"bar\"}]}, \"then\": {\"prefixItems\": [true, true, {\"const\": \"then\"}]}, \"else\": {\"prefixItems\": [true, true, true, {\"const\": \"else\"}]}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", \"bar\", \"then\", \"else\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g14] unevaluatedItems with if/then/else - when if doesn't match and it has no unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"const\": \"foo\"}], \"if\": {\"prefixItems\": [true, {\"const\": \"bar\"}]}, \"then\": {\"prefixItems\": [true, true, {\"const\": \"then\"}]}, \"else\": {\"prefixItems\": [true, true, true, {\"const\": \"else\"}]}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", 42, 42, \"else\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g14] unevaluatedItems with if/then/else - when if doesn't match and it has unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"const\": \"foo\"}], \"if\": {\"prefixItems\": [true, {\"const\": \"bar\"}]}, \"then\": {\"prefixItems\": [true, true, {\"const\": \"then\"}]}, \"else\": {\"prefixItems\": [true, true, true, {\"const\": \"else\"}]}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", 42, 42, \"else\", 42]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g15] unevaluatedItems with boolean schemas - with no unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [true], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g15] unevaluatedItems with boolean schemas - with unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [true], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g16] unevaluatedItems with $ref - with no unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"#/$defs/bar\", \"prefixItems\": [{\"type\": \"string\"}], \"unevaluatedItems\": false, \"$defs\": {\"bar\": {\"prefixItems\": [true, {\"type\": \"string\"}]}}}",
  )
  let data = @json.parse("[\"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g16] unevaluatedItems with $ref - with unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$ref\": \"#/$defs/bar\", \"prefixItems\": [{\"type\": \"string\"}], \"unevaluatedItems\": false, \"$defs\": {\"bar\": {\"prefixItems\": [true, {\"type\": \"string\"}]}}}",
  )
  let data = @json.parse("[\"foo\", \"bar\", \"baz\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g17] unevaluatedItems before $ref - with no unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": false, \"prefixItems\": [{\"type\": \"string\"}], \"$ref\": \"#/$defs/bar\", \"$defs\": {\"bar\": {\"prefixItems\": [true, {\"type\": \"string\"}]}}}",
  )
  let data = @json.parse("[\"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g17] unevaluatedItems before $ref - with unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": false, \"prefixItems\": [{\"type\": \"string\"}], \"$ref\": \"#/$defs/bar\", \"$defs\": {\"bar\": {\"prefixItems\": [true, {\"type\": \"string\"}]}}}",
  )
  let data = @json.parse("[\"foo\", \"bar\", \"baz\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g18] unevaluatedItems with $dynamicRef - with no unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://example.com/unevaluated-items-with-dynamic-ref/derived\", \"$ref\": \"./baseSchema\", \"$defs\": {\"derived\": {\"$dynamicAnchor\": \"addons\", \"prefixItems\": [true, {\"type\": \"string\"}]}, \"baseSchema\": {\"$id\": \"./baseSchema\", \"$comment\": \"unevaluatedItems comes first so it's more likely to catch bugs with implementations that are sensitive to keyword ordering\", \"unevaluatedItems\": false, \"type\": \"array\", \"prefixItems\": [{\"type\": \"string\"}], \"$dynamicRef\": \"#addons\", \"$defs\": {\"defaultAddons\": {\"$comment\": \"Needed to satisfy the bookending requirement\", \"$dynamicAnchor\": \"addons\"}}}}}",
  )
  let data = @json.parse("[\"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g18] unevaluatedItems with $dynamicRef - with unevaluated items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"https://example.com/unevaluated-items-with-dynamic-ref/derived\", \"$ref\": \"./baseSchema\", \"$defs\": {\"derived\": {\"$dynamicAnchor\": \"addons\", \"prefixItems\": [true, {\"type\": \"string\"}]}, \"baseSchema\": {\"$id\": \"./baseSchema\", \"$comment\": \"unevaluatedItems comes first so it's more likely to catch bugs with implementations that are sensitive to keyword ordering\", \"unevaluatedItems\": false, \"type\": \"array\", \"prefixItems\": [{\"type\": \"string\"}], \"$dynamicRef\": \"#addons\", \"$defs\": {\"defaultAddons\": {\"$comment\": \"Needed to satisfy the bookending requirement\", \"$dynamicAnchor\": \"addons\"}}}}}",
  )
  let data = @json.parse("[\"foo\", \"bar\", \"baz\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g19] unevaluatedItems can't see inside cousins - always fails" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"prefixItems\": [true]}, {\"unevaluatedItems\": false}]}",
  )
  let data = @json.parse("[1]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g20] item is evaluated in an uncle schema to unevaluatedItems - no extra items" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"prefixItems\": [{\"type\": \"string\"}], \"unevaluatedItems\": false}}, \"anyOf\": [{\"properties\": {\"foo\": {\"prefixItems\": [true, {\"type\": \"string\"}]}}}]}",
  )
  let data = @json.parse("{\"foo\": [\"test\"]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g20] item is evaluated in an uncle schema to unevaluatedItems - uncle keyword evaluation is not significant" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"properties\": {\"foo\": {\"prefixItems\": [{\"type\": \"string\"}], \"unevaluatedItems\": false}}, \"anyOf\": [{\"properties\": {\"foo\": {\"prefixItems\": [true, {\"type\": \"string\"}]}}}]}",
  )
  let data = @json.parse("{\"foo\": [\"test\", \"test\"]}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g21] unevaluatedItems depends on adjacent contains - second item is evaluated by contains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [true], \"contains\": {\"type\": \"string\"}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[1, \"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g21] unevaluatedItems depends on adjacent contains - contains fails, second item is not evaluated" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [true], \"contains\": {\"type\": \"string\"}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[1, 2]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g21] unevaluatedItems depends on adjacent contains - contains passes, second item is not evaluated" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [true], \"contains\": {\"type\": \"string\"}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[1, 2, \"foo\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g22] unevaluatedItems depends on multiple nested contains - 5 not evaluated, passes unevaluatedItems" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"contains\": {\"multipleOf\": 2}}, {\"contains\": {\"multipleOf\": 3}}], \"unevaluatedItems\": {\"multipleOf\": 5}}",
  )
  let data = @json.parse("[2, 3, 4, 5, 6]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g22] unevaluatedItems depends on multiple nested contains - 7 not evaluated, fails unevaluatedItems" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"allOf\": [{\"contains\": {\"multipleOf\": 2}}, {\"contains\": {\"multipleOf\": 3}}], \"unevaluatedItems\": {\"multipleOf\": 5}}",
  )
  let data = @json.parse("[2, 3, 4, 7, 8]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g23] unevaluatedItems and contains interact to control item dependency relationship - empty array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"contains\": {\"const\": \"a\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"b\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"c\"}}}}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g23] unevaluatedItems and contains interact to control item dependency relationship - only a's are valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"contains\": {\"const\": \"a\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"b\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"c\"}}}}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"a\", \"a\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g23] unevaluatedItems and contains interact to control item dependency relationship - a's and b's are valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"contains\": {\"const\": \"a\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"b\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"c\"}}}}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"a\", \"b\", \"a\", \"b\", \"a\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g23] unevaluatedItems and contains interact to control item dependency relationship - a's, b's and c's are valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"contains\": {\"const\": \"a\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"b\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"c\"}}}}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"c\", \"a\", \"c\", \"c\", \"b\", \"a\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g23] unevaluatedItems and contains interact to control item dependency relationship - only b's are invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"contains\": {\"const\": \"a\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"b\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"c\"}}}}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"b\", \"b\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g23] unevaluatedItems and contains interact to control item dependency relationship - only c's are invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"contains\": {\"const\": \"a\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"b\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"c\"}}}}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"c\", \"c\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g23] unevaluatedItems and contains interact to control item dependency relationship - only b's and c's are invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"contains\": {\"const\": \"a\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"b\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"c\"}}}}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"c\", \"b\", \"c\", \"b\", \"c\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g23] unevaluatedItems and contains interact to control item dependency relationship - only a's and c's are invalid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"contains\": {\"const\": \"a\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"b\"}}, \"then\": {\"if\": {\"contains\": {\"const\": \"c\"}}}}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"c\", \"a\", \"c\", \"a\", \"c\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g24] unevaluatedItems with minContains = 0 - empty array is valid" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"type\": \"string\"}, \"minContains\": 0, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g24] unevaluatedItems with minContains = 0 - no items evaluated by contains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"type\": \"string\"}, \"minContains\": 0, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[0]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g24] unevaluatedItems with minContains = 0 - some but not all items evaluated by contains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"type\": \"string\"}, \"minContains\": 0, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", 0]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g24] unevaluatedItems with minContains = 0 - all items evaluated by contains" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"contains\": {\"type\": \"string\"}, \"minContains\": 0, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"foo\", \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g25] non-array instances are valid - ignores booleans" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": false}",
  )
  let data = @json.parse("true")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g25] non-array instances are valid - ignores integers" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": false}",
  )
  let data = @json.parse("123")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g25] non-array instances are valid - ignores floats" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": false}",
  )
  let data = @json.parse("1.0")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g25] non-array instances are valid - ignores objects" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": false}",
  )
  let data = @json.parse("{}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g25] non-array instances are valid - ignores strings" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": false}",
  )
  let data = @json.parse("\"foo\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g25] non-array instances are valid - ignores null" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": false}",
  )
  let data = @json.parse("null")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g26] unevaluatedItems with null instance elements - allows null elements" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"unevaluatedItems\": {\"type\": \"null\"}}",
  )
  let data = @json.parse("[null]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g27] unevaluatedItems can see annotations from if without then and else - valid in case if is evaluated" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"prefixItems\": [{\"const\": \"a\"}]}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"a\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "unevaluatedItems [g27] unevaluatedItems can see annotations from if without then and else - invalid in case if is evaluated" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"if\": {\"prefixItems\": [{\"const\": \"a\"}]}, \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[\"b\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "unevaluatedItems [g28] Evaluated items collection needs to consider instance location - with an unevaluated item that exists at another location" {
  let schema = @json.parse(
    "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"prefixItems\": [true, {\"type\": \"string\"}]}], \"unevaluatedItems\": false}",
  )
  let data = @json.parse("[[\"foo\", \"bar\"], \"bar\"]")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}
