// Generated remote-document registry for $ref resolution.
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

// Registry of external documents available for $ref resolution
// (the suite's HTTP remotes, vendored under suite/remotes).
///|
fn docs() -> Map[String, Json] {
  let m : Map[String, Json] = Map([])
  m.set(
    "http://localhost:1234/draft2020-12/baseUriChange/folderInteger.json",
    @json.parse(
      "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"integer\"}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/baseUriChangeFolder/folderInteger.json",
    @json.parse(
      "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"integer\"}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/baseUriChangeFolderInSubschema/folderInteger.json",
    @json.parse(
      "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"integer\"}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/detached-dynamicref.json",
    @json.parse(
      "{\"$id\": \"http://localhost:1234/draft2020-12/detached-dynamicref.json\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"foo\": {\"$dynamicRef\": \"#detached\"}, \"detached\": {\"$dynamicAnchor\": \"detached\", \"type\": \"integer\"}}}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/detached-ref.json",
    @json.parse(
      "{\"$id\": \"http://localhost:1234/draft2020-12/detached-ref.json\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"foo\": {\"$ref\": \"#detached\"}, \"detached\": {\"$anchor\": \"detached\", \"type\": \"integer\"}}}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/different-id-ref-string.json",
    @json.parse(
      "{\"$id\": \"http://localhost:1234/draft2020-12/real-id-ref-string.json\", \"$defs\": {\"bar\": {\"type\": \"string\"}}, \"$ref\": \"#/$defs/bar\"}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/extendible-dynamic-ref.json",
    @json.parse(
      "{\"description\": \"extendible array\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/extendible-dynamic-ref.json\", \"type\": \"object\", \"properties\": {\"elements\": {\"type\": \"array\", \"items\": {\"$dynamicRef\": \"#elements\"}}}, \"required\": [\"elements\"], \"additionalProperties\": false, \"$defs\": {\"elements\": {\"$dynamicAnchor\": \"elements\"}}}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/format-assertion-false.json",
    @json.parse(
      "{\"$id\": \"http://localhost:1234/draft2020-12/format-assertion-false.json\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$vocabulary\": {\"https://json-schema.org/draft/2020-12/vocab/core\": true, \"https://json-schema.org/draft/2020-12/vocab/format-assertion\": false}, \"$dynamicAnchor\": \"meta\", \"allOf\": [{\"$ref\": \"https://json-schema.org/draft/2020-12/meta/core\"}, {\"$ref\": \"https://json-schema.org/draft/2020-12/meta/format-assertion\"}]}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/format-assertion-true.json",
    @json.parse(
      "{\"$id\": \"http://localhost:1234/draft2020-12/format-assertion-true.json\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$vocabulary\": {\"https://json-schema.org/draft/2020-12/vocab/core\": true, \"https://json-schema.org/draft/2020-12/vocab/format-assertion\": true}, \"$dynamicAnchor\": \"meta\", \"allOf\": [{\"$ref\": \"https://json-schema.org/draft/2020-12/meta/core\"}, {\"$ref\": \"https://json-schema.org/draft/2020-12/meta/format-assertion\"}]}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/integer.json",
    @json.parse(
      "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"integer\"}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/locationIndependentIdentifier.json",
    @json.parse(
      "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"refToInteger\": {\"$ref\": \"#foo\"}, \"A\": {\"$anchor\": \"foo\", \"type\": \"integer\"}}}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/metaschema-no-validation.json",
    @json.parse(
      "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/metaschema-no-validation.json\", \"$vocabulary\": {\"https://json-schema.org/draft/2020-12/vocab/applicator\": true, \"https://json-schema.org/draft/2020-12/vocab/core\": true}, \"$dynamicAnchor\": \"meta\", \"allOf\": [{\"$ref\": \"https://json-schema.org/draft/2020-12/meta/applicator\"}, {\"$ref\": \"https://json-schema.org/draft/2020-12/meta/core\"}]}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/metaschema-optional-vocabulary.json",
    @json.parse(
      "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/metaschema-optional-vocabulary.json\", \"$vocabulary\": {\"https://json-schema.org/draft/2020-12/vocab/validation\": true, \"https://json-schema.org/draft/2020-12/vocab/core\": true, \"http://localhost:1234/draft/2020-12/vocab/custom\": false}, \"$dynamicAnchor\": \"meta\", \"allOf\": [{\"$ref\": \"https://json-schema.org/draft/2020-12/meta/validation\"}, {\"$ref\": \"https://json-schema.org/draft/2020-12/meta/core\"}]}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/name-defs.json",
    @json.parse(
      "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"orNull\": {\"anyOf\": [{\"type\": \"null\"}, {\"$ref\": \"#\"}]}}, \"type\": \"string\"}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/nested-absolute-ref-to-string.json",
    @json.parse(
      "{\"$defs\": {\"bar\": {\"$id\": \"http://localhost:1234/draft2020-12/the-nested-id.json\", \"type\": \"string\"}}, \"$ref\": \"http://localhost:1234/draft2020-12/the-nested-id.json\"}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/nested/foo-ref-string.json",
    @json.parse(
      "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"object\", \"properties\": {\"foo\": {\"$ref\": \"string.json\"}}}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/nested/string.json",
    @json.parse(
      "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"type\": \"string\"}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/prefixItems.json",
    @json.parse(
      "{\"$id\": \"http://localhost:1234/draft2020-12/prefixItems.json\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"prefixItems\": [{\"type\": \"string\"}]}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/real-id-ref-string.json",
    @json.parse(
      "{\"$id\": \"http://localhost:1234/draft2020-12/real-id-ref-string.json\", \"$defs\": {\"bar\": {\"type\": \"string\"}}, \"$ref\": \"#/$defs/bar\"}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/ref-and-defs.json",
    @json.parse(
      "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/ref-and-defs.json\", \"$defs\": {\"inner\": {\"properties\": {\"bar\": {\"type\": \"string\"}}}}, \"$ref\": \"#/$defs/inner\"}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/subSchemas.json",
    @json.parse(
      "{\"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$defs\": {\"integer\": {\"type\": \"integer\"}, \"refToInteger\": {\"$ref\": \"#/$defs/integer\"}}}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/tree.json",
    @json.parse(
      "{\"description\": \"tree schema, extensible\", \"$schema\": \"https://json-schema.org/draft/2020-12/schema\", \"$id\": \"http://localhost:1234/draft2020-12/tree.json\", \"$dynamicAnchor\": \"node\", \"type\": \"object\", \"properties\": {\"data\": true, \"children\": {\"type\": \"array\", \"items\": {\"$dynamicRef\": \"#node\"}}}}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "http://localhost:1234/draft2020-12/urn-ref-string.json",
    @json.parse(
      "{\"$id\": \"urn:uuid:feebdaed-ffff-0000-2020-1200deadbeef\", \"$defs\": {\"bar\": {\"type\": \"string\"}}, \"$ref\": \"#/$defs/bar\"}",
    ) catch {
      _ => Json::null()
    },
  )
  m.set(
    "urn:uuid:feebdaed-ffff-0000-2020-1200deadbeef",
    @json.parse(
      "{\"$id\": \"urn:uuid:feebdaed-ffff-0000-2020-1200deadbeef\", \"$defs\": {\"bar\": {\"type\": \"string\"}}, \"$ref\": \"#/$defs/bar\"}",
    ) catch {
      _ => Json::null()
    },
  )
  m
}
