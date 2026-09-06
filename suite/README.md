# Test fixtures and remotes

Files in `fixtures/` and `remotes/` are vendored from the official
[JSON-Schema-Test-Suite](https://github.com/json-schema-org/JSON-Schema-Test-Suite)
(`tests/draft2020-12/` and `remotes/draft2020-12/`), which is distributed
under the MIT License.

- `fixtures/` — non-optional draft 2020-12 test cases (`refRemote.json`
  excluded: it requires a live HTTP server)
- `remotes/` — schema documents the suite serves over HTTP; we register
  them with the validator via `validate_with_docs` instead

The MoonBit tests in `suite/gen/` are generated from these files by
`tools/gen_suite.py`; regenerate with `python tools/gen_suite.py`.
