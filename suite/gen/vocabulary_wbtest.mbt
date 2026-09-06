// Generated from JSON-Schema-Test-Suite tests/draft2020-12/vocabulary.json
// (vendored copy in suite/fixtures/vocabulary.json, MIT License)
// DO NOT EDIT - regenerate with: python tools/gen_suite.py

///|
test "vocabulary [g0] schema that uses custom metaschema with with no validation vocabulary - applicator vocabulary still works" {
  let schema = @json.parse(
    "{\"$id\": \"https://schema/using/no/validation\", \"$schema\": \"http://localhost:1234/draft2020-12/metaschema-no-validation.json\", \"properties\": {\"badProperty\": false, \"numberProperty\": {\"minimum\": 10}}}",
  )
  let data = @json.parse(
    "{\"badProperty\": \"this property should not exist\"}",
  )
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "vocabulary [g0] schema that uses custom metaschema with with no validation vocabulary - no validation: valid number" {
  let schema = @json.parse(
    "{\"$id\": \"https://schema/using/no/validation\", \"$schema\": \"http://localhost:1234/draft2020-12/metaschema-no-validation.json\", \"properties\": {\"badProperty\": false, \"numberProperty\": {\"minimum\": 10}}}",
  )
  let data = @json.parse("{\"numberProperty\": 20}")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}

///|
test "vocabulary [g1] ignore unrecognized optional vocabulary - string value" {
  let schema = @json.parse(
    "{\"$schema\": \"http://localhost:1234/draft2020-12/metaschema-optional-vocabulary.json\", \"type\": \"number\"}",
  )
  let data = @json.parse("\"foobar\"")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="false",
  )
}

///|
test "vocabulary [g1] ignore unrecognized optional vocabulary - number value" {
  let schema = @json.parse(
    "{\"$schema\": \"http://localhost:1234/draft2020-12/metaschema-optional-vocabulary.json\", \"type\": \"number\"}",
  )
  let data = @json.parse("20")
  inspect(
    @jsonschema.validate_with_docs(schema, data, docs()) is Ok(_),
    content="true",
  )
}
