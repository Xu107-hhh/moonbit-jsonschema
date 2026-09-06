///|
/// CLI entry: validate an instance against a schema.
///
/// Usage:
///   moon run cmd/main -- '<schema-json>' '<instance-json>'
///   moon run cmd/main -- "$(cat schema.json)" "$(cat instance.json)"
///
/// Prints "valid" or the list of validation errors (instance path,
/// keyword, schema path, message). Exits non-zero on validation,
/// usage, or parse errors.
fn main {
  let cmd = @argparse.Command::Command(
    "moonbit-jsonschema",
    positionals=[
      @argparse.PositionArg::PositionArg(
        "schema",
        about="JSON Schema document (2020-12) as text",
      ),
      @argparse.PositionArg::PositionArg(
        "instance",
        about="JSON instance document as text",
      ),
    ],
    about="Validate a JSON instance against a JSON Schema (2020-12)",
  )
  let matches = cmd.parse() catch {
    _ => return // argparse has already printed its error/help
  }
  let schema_text = match matches.values.get("schema") {
    Some(arr) if arr.length() > 0 => arr[0]
    _ => return
  }
  let instance_text = match matches.values.get("instance") {
    Some(arr) if arr.length() > 0 => arr[0]
    _ => return
  }
  match @lib.validate_json(schema_text, instance_text) {
    Ok(_) => println("valid")
    Err(@lib.SchemaParseError(msg)) => {
      println("schema parse error: \{msg}")
      abort("invalid schema")
    }
    Err(@lib.InstanceParseError(msg)) => {
      println("instance parse error: \{msg}")
      abort("invalid instance")
    }
    Err(@lib.ValidationErrors(errors)) => {
      for e in errors {
        println(
          "invalid at \{e.instance_path}: \{e.message} (\{e.keyword} at \{e.schema_path})",
        )
      }
      abort("validation failed")
    }
  }
}
