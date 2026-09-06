// Blackbox tests run against the package's public API. Use `@moonbit-jsonschema` to import.
// Prefer high-level behaviors over implementation details.
// Run `moon test` to execute and `moon test --update` to refresh snapshots.

///|
test "version returns the library semver" {
  inspect(@moonbit-jsonschema.version(), content="0.1.0")
}

///|
test "validate_json: type keyword" {
  let schema = "{\"type\": \"string\"}"
  inspect(
    @moonbit-jsonschema.validate_json(schema, "\"hello\"") is Ok(_),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.validate_json(schema, "42") is Err(_),
    content="true",
  )
}

///|
test "validate_json: parse errors are separated from validation errors" {
  match @moonbit-jsonschema.validate_json("{bad json", "1") {
    Err(e) =>
      inspect(e is @moonbit-jsonschema.SchemaParseError(_), content="true")
    Ok(_) => inspect("unexpected ok", content="")
  }
  match @moonbit-jsonschema.validate_json("true", "{bad") {
    Err(e) =>
      inspect(e is @moonbit-jsonschema.InstanceParseError(_), content="true")
    Ok(_) => inspect("unexpected ok", content="")
  }
}

///|
test "validate: boolean schemas" {
  let t = Json::boolean(true)
  let f = Json::boolean(false)
  inspect(@moonbit-jsonschema.is_valid(t, Json::null()), content="true")
  inspect(@moonbit-jsonschema.is_valid(f, Json::null()), content="false")
}

///|
test "validate: type list" {
  let schema = @json.parse("{\"type\": [\"string\", \"integer\"]}")
  inspect(
    @moonbit-jsonschema.is_valid(schema, Json::string("x")),
    content="true",
  )
  inspect(@moonbit-jsonschema.is_valid(schema, Json::number(3)), content="true")
  inspect(
    @moonbit-jsonschema.is_valid(schema, Json::number(3.5)),
    content="false",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, Json::boolean(true)),
    content="false",
  )
}

///|
test "validate: integer accepts 1.0 form" {
  let schema = @json.parse("{\"type\": \"integer\"}")
  inspect(
    @moonbit-jsonschema.is_valid(schema, Json::number(1.0)),
    content="true",
  )
}

///|
test "validate: enum and const" {
  let schema = @json.parse("{\"enum\": [1, \"red\", null]}")
  inspect(
    @moonbit-jsonschema.is_valid(schema, Json::string("red")),
    content="true",
  )
  inspect(@moonbit-jsonschema.is_valid(schema, Json::number(1)), content="true")
  inspect(@moonbit-jsonschema.is_valid(schema, Json::null()), content="true")
  inspect(
    @moonbit-jsonschema.is_valid(schema, Json::number(2)),
    content="false",
  )
  let const_schema = @json.parse("{\"const\": 2.5}")
  inspect(
    @moonbit-jsonschema.is_valid(const_schema, Json::number(2.5)),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(const_schema, Json::number(2)),
    content="false",
  )
}

///|
test "validate: numeric keywords" {
  let schema = @json.parse(
    "{\"minimum\": 2, \"maximum\": 10, \"exclusiveMaximum\": 10, \"multipleOf\": 2}",
  )
  inspect(@moonbit-jsonschema.is_valid(schema, Json::number(4)), content="true")
  inspect(
    @moonbit-jsonschema.is_valid(schema, Json::number(3)),
    content="false",
  ) // multipleOf
  inspect(
    @moonbit-jsonschema.is_valid(schema, Json::number(1)),
    content="false",
  ) // minimum
  inspect(
    @moonbit-jsonschema.is_valid(schema, Json::number(10)),
    content="false",
  ) // exclusiveMaximum
  inspect(@moonbit-jsonschema.is_valid(schema, Json::number(8)), content="true")
}

///|
test "validate: string keywords with unicode length" {
  let schema = @json.parse("{\"minLength\": 2, \"maxLength\": 3}")
  inspect(
    @moonbit-jsonschema.is_valid(schema, Json::string("你好吗")),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, Json::string("你")),
    content="false",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, Json::string("你好吗啊")),
    content="false",
  )
}

///|
test "validate: pattern" {
  let schema = @json.parse("{\"pattern\": \"^a.*b$\"}")
  inspect(
    @moonbit-jsonschema.is_valid(schema, Json::string("axxb")),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, Json::string("axx")),
    content="false",
  )
}

///|
test "validate: array keywords" {
  let schema = @json.parse(
    "{\"items\": {\"type\": \"integer\"}, \"minItems\": 2, \"maxItems\": 3, \"uniqueItems\": true}",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("[1, 2]")),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("[1, 2, 3, 4]")),
    content="false",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("[1]")),
    content="false",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("[1, 1]")),
    content="false",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("[1, \"x\"]")),
    content="false",
  )
}

///|
test "validate: prefixItems (2020-12 tuple form)" {
  let schema = @json.parse(
    "{\"prefixItems\": [{\"type\": \"string\"}], \"items\": {\"type\": \"integer\"}}",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("[\"a\", 1, 2]")),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("[\"a\", \"b\"]")),
    content="false",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("[1]")),
    content="false",
  )
}

///|
test "validate: uniqueItems treats 1 and 1.0 as equal" {
  let schema = @json.parse("{\"uniqueItems\": true}")
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("[1, 1.0]")),
    content="false",
  )
}

///|
test "validate: contains with minContains/maxContains" {
  let schema = @json.parse(
    "{\"contains\": {\"type\": \"integer\"}, \"minContains\": 1, \"maxContains\": 2}",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("[\"a\", 1]")),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("[1, 2, 3]")),
    content="false",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("[\"a\"]")),
    content="false",
  )
}

///|
test "validate: object keywords" {
  let schema = @json.parse(
    (
      #|{
      #|  "type": "object",
      #|  "properties": { "name": {"type": "string"}, "age": {"type": "integer"} },
      #|  "required": ["name"],
      #|  "additionalProperties": false
      #|}
    ),
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("{\"name\": \"x\"}")),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(
      schema,
      @json.parse("{\"name\": \"x\", \"age\": 3}"),
    ),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("{}")),
    content="false",
  ) // required
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("{\"age\": 3}")),
    content="false",
  )
  inspect(
    @moonbit-jsonschema.is_valid(
      schema,
      @json.parse("{\"name\": \"x\", \"extra\": 1}"),
    ),
    content="false",
  )
}

///|
test "validate: patternProperties and propertyNames" {
  let schema = @json.parse(
    (
      #|{
      #|  "patternProperties": { "^S_": {"type": "string"} },
      #|  "propertyNames": { "maxLength": 3 }
      #|}
    ),
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("{\"S_x\": \"v\"}")),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("{\"S_x\": 3}")),
    content="false",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("{\"LONG\": \"v\"}")),
    content="false",
  )
}

///|
test "validate: dependentRequired" {
  let schema = @json.parse(
    "{\"dependentRequired\": {\"credit_card\": [\"billing_address\"]}}",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("{}")),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(
      schema,
      @json.parse("{\"credit_card\": 1, \"billing_address\": \"x\"}"),
    ),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("{\"credit_card\": 1}")),
    content="false",
  )
}

///|
test "validate: combinators" {
  let any_of = @json.parse(
    "{\"anyOf\": [{\"type\": \"string\"}, {\"type\": \"integer\"}]}",
  )
  inspect(
    @moonbit-jsonschema.is_valid(any_of, Json::string("x")),
    content="true",
  )
  inspect(@moonbit-jsonschema.is_valid(any_of, Json::number(1)), content="true")
  inspect(@moonbit-jsonschema.is_valid(any_of, Json::null()), content="false")
  let one_of = @json.parse(
    "{\"oneOf\": [{\"type\": \"integer\"}, {\"minimum\": 2}]}",
  )
  inspect(@moonbit-jsonschema.is_valid(one_of, Json::number(1)), content="true") // int only
  inspect(
    @moonbit-jsonschema.is_valid(one_of, Json::number(2.5)),
    content="true",
  ) // min only
  inspect(
    @moonbit-jsonschema.is_valid(one_of, Json::number(3)),
    content="false",
  ) // both
  // a string is trivially valid against {"minimum": 2} (numeric keywords
  // only apply to numbers), so it matches exactly one branch
  inspect(
    @moonbit-jsonschema.is_valid(one_of, Json::string("x")),
    content="true",
  )
  let one_of_strict = @json.parse(
    "{\"oneOf\": [{\"type\": \"integer\"}, {\"type\": \"string\", \"minLength\": 5}]}",
  )
  inspect(
    @moonbit-jsonschema.is_valid(one_of_strict, Json::string("abc")),
    content="false",
  ) // none
  let all_of = @json.parse(
    "{\"allOf\": [{\"type\": \"integer\"}, {\"minimum\": 2}]}",
  )
  inspect(@moonbit-jsonschema.is_valid(all_of, Json::number(3)), content="true")
  inspect(
    @moonbit-jsonschema.is_valid(all_of, Json::number(1)),
    content="false",
  )
  let not_schema = @json.parse("{\"not\": {\"type\": \"integer\"}}")
  inspect(
    @moonbit-jsonschema.is_valid(not_schema, Json::string("x")),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(not_schema, Json::number(1)),
    content="false",
  )
}

///|
test "validate: if/then/else" {
  let schema = @json.parse(
    (
      #|{
      #|  "if": { "properties": { "kind": { "const": "rect" } } },
      #|  "then": { "required": ["width"] },
      #|  "else": { "required": ["radius"] }
      #|}
    ),
  )
  inspect(
    @moonbit-jsonschema.is_valid(
      schema,
      @json.parse("{\"kind\": \"rect\", \"width\": 1}"),
    ),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("{\"kind\": \"rect\"}")),
    content="false",
  )
  inspect(
    @moonbit-jsonschema.is_valid(
      schema,
      @json.parse("{\"kind\": \"circle\", \"radius\": 1}"),
    ),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("{\"kind\": \"circle\"}")),
    content="false",
  )
}

///|
test "validate: ref to $defs" {
  let schema = @json.parse(
    (
      #|{
      #|  "type": "object",
      #|  "properties": { "child": { "$ref": "#/$defs/node" } },
      #|  "$defs": { "node": { "type": "object" } }
      #|}
    ),
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("{\"child\": {}}")),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("{\"child\": 3}")),
    content="false",
  )
}

///|
test "validate: recursive schema via $ref terminates" {
  let schema = @json.parse(
    (
      #|{
      #|  "type": "object",
      #|  "properties": { "next": { "$ref": "#" } }
      #|}
    ),
  )
  inspect(
    @moonbit-jsonschema.is_valid(
      schema,
      @json.parse("{\"next\": {\"next\": {}}}"),
    ),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("{\"next\": 3}")),
    content="false",
  )
}

///|
test "validate: $anchor reference" {
  let schema = @json.parse(
    (
      #|{
      #|  "properties": { "a": { "$ref": "#nameAnchor" } },
      #|  "$defs": { "target": { "$anchor": "nameAnchor", "type": "string" } }
      #|}
    ),
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("{\"a\": \"x\"}")),
    content="true",
  )
  inspect(
    @moonbit-jsonschema.is_valid(schema, @json.parse("{\"a\": 1}")),
    content="false",
  )
}

///|
test "validate: errors carry precise instance and schema paths" {
  let schema = @json.parse(
    (
      #|{
      #|  "properties": {
      #|    "users": { "items": { "properties": { "age": { "type": "integer" } } } }
      #|  }
      #|}
    ),
  )
  match
    @moonbit-jsonschema.validate(
      schema,
      @json.parse("{\"users\": [{\"age\": \"old\"}]}"),
    ) {
    Err(errors) => {
      let e = errors[0]
      inspect(e.instance_path, content="/users/0/age")
      inspect(
        e.schema_path,
        content="#/properties/users/items/properties/age/type",
      )
      inspect(e.keyword, content="type")
    }
    Ok(_) => inspect("unexpected ok", content="")
  }
}

///|
test "validate: collects all errors, not just the first" {
  let schema = @json.parse(
    "{\"type\": \"object\", \"properties\": {\"a\": {\"type\": \"integer\"}, \"b\": {\"type\": \"integer\"}}}",
  )
  match
    @moonbit-jsonschema.validate(
      schema,
      @json.parse("{\"a\": \"x\", \"b\": \"y\"}"),
    ) {
    Err(errors) => inspect(errors.length(), content="2")
    Ok(_) => inspect("unexpected ok", content="")
  }
}

///|
test "validate: property names with slash are escaped in paths" {
  let schema = @json.parse(
    "{\"properties\": {\"a/b\": {\"type\": \"integer\"}}}",
  )
  match @moonbit-jsonschema.validate(schema, @json.parse("{\"a/b\": \"x\"}")) {
    Err(errors) => inspect(errors[0].instance_path, content="/a~1b")
    Ok(_) => inspect("unexpected ok", content="")
  }
}
