// Blackbox tests run against the package's public API. Use `@moonbit-jsonschema` to import.
// Prefer high-level behaviors over implementation details.
// Run `moon test` to execute and `moon test --update` to refresh snapshots.

///|
test "version returns the library semver" {
  inspect(@moonbit-jsonschema.version(), content="0.1.0")
}
