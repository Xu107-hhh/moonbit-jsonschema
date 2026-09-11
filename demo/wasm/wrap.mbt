// WASM wrapper exposing the validator to JavaScript.
//
// Build:  moon build --release --target wasm-gc demo/wasm
// Output: _build/wasm-gc/release/build/demo/wasm/*.wasm
//
// JS side loads it with:
//   WebAssembly.instantiateStreaming(fetch(url), {}, {
//     builtins: ["js-string"], importedStringConstants: "_",
//   })
// and calls `validate(schemaText, instanceText)` with plain JS strings.

///|
/// Validate and return a JSON report for the browser:
///   { "valid": true|"false",
///     "stage": "validation"|"schema"|"instance",
///     "message": "parse error text when stage != validation",
///     "errors": [ { instancePath, schemaPath, keyword, message } ] }
#export_name("validate")
pub fn validate(schema_text : String, instance_text : String) -> String {
  match @lib.validate_json(schema_text, instance_text) {
    Ok(_) =>
      Json::object({
        "valid": Json::boolean(true),
        "stage": Json::string("validation"),
        "message": Json::string(""),
        "errors": Json::array([]),
      }).stringify()
    Err(@lib.SchemaParseError(msg)) => parse_error_report("schema", msg)
    Err(@lib.InstanceParseError(msg)) => parse_error_report("instance", msg)
    Err(@lib.ValidationErrors(errors)) => {
      let items : Array[Json] = []
      for e in errors {
        items.push(
          Json::object({
            "instancePath": Json::string(e.instance_path),
            "schemaPath": Json::string(e.schema_path),
            "keyword": Json::string(e.keyword),
            "message": Json::string(e.message),
          }),
        )
      }
      Json::object({
        "valid": Json::boolean(false),
        "stage": Json::string("validation"),
        "message": Json::string(""),
        "errors": Json::array(items),
      }).stringify()
    }
  }
}

///|
fn parse_error_report(stage : String, msg : String) -> String {
  Json::object({
    "valid": Json::boolean(false),
    "stage": Json::string(stage),
    "message": Json::string(msg),
    "errors": Json::array([]),
  }).stringify()
}
