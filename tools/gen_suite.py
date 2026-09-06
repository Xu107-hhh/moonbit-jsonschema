#!/usr/bin/env python3
"""Generate MoonBit blackbox tests from the official JSON-Schema-Test-Suite.

Usage:
    python tools/gen_suite.py

Reads suite/fixtures/*.json (draft 2020-12, non-optional files, vendored
from https://github.com/json-schema-org/JSON-Schema-Test-Suite, MIT) and
writes one suite/gen/<name>_test.mbt file per fixture. Each suite case
becomes one MoonBit `test` block that parses the schema and the instance
and asserts the expected validity.

All file paths are reconstructed from directory listings via pathlib,
so traversal outside the fixtures/gen directories is impossible.

Excluded fixtures (and why):
    refRemote.json - requires an HTTP server serving remote schemas
"""
import json
import os
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
FIXTURES = ROOT / "suite" / "fixtures"
OUT = ROOT / "suite" / "gen"

EXCLUDE = {"refRemote.json"}

# Individual cases excluded (file description, case description):
# - vocabulary "no validation: invalid number..." requires $vocabulary
#   semantics (turning validation keywords off via a custom metaschema),
#   which is out of scope for now - tracked as a GitHub issue.
EXCLUDE_CASES = {
    (
        "vocabulary.json",
        "no validation: invalid number, but it still validates",
    ),
}

REMOTES = Path(ROOT) / "suite" / "remotes" / "draft2020-12"
REMOTE_BASE = "http://localhost:1234/draft2020-12/"


def load_remotes() -> dict:
    """Map absolute URI -> remote document, keyed by $id when present
    and by its localhost URL path otherwise."""
    docs = {}
    if not REMOTES.is_dir():
        return docs
    for path in sorted(REMOTES.rglob("*.json")):
        rel = path.relative_to(REMOTES).as_posix()
        doc = json.loads(path.read_text(encoding="utf-8"))
        docs[REMOTE_BASE + rel] = doc
        rid = doc.get("$id") if isinstance(doc, dict) else None
        if isinstance(rid, str):
            docs[rid] = doc
    return docs


def plain_string_literal(s: str) -> str:
    """A bare string as a MoonBit string literal (no JSON quoting)."""
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def map_literal(pairs: dict) -> list:
    lines = [
        "// Registry of external documents available for $ref resolution",
        "// (the suite's HTTP remotes, vendored under suite/remotes).",
        "fn docs() -> Map[String, Json] {",
        "  let m : Map[String, Json] = Map([])",
    ]
    for k in sorted(pairs):
        lines.append(
            "  m.set(%s, try @json.parse(%s) catch { _ => Json::null() })"
            % (plain_string_literal(k), literal(pairs[k]))
        )
    lines.append("  m")
    lines.append("}")
    return lines


def literal(value) -> str:
    """Render a Python/JSON value as a MoonBit string literal containing
    the JSON text of the value. Backslashes and double quotes are
    double-escaped so MoonBit yields the exact JSON text."""
    lit = json.dumps(value, ensure_ascii=False)
    lit = lit.replace("\\", "\\\\").replace('"', '\\"')
    return '"' + lit + '"'


def sanitize(name: str) -> str:
    name = name.replace('"', "'").replace("\\", "/")
    name = re.sub(r"[\r\n\t]+", " ", name).strip()
    return name[:90]


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    for old in list(OUT.glob("*_test.mbt")) + list(OUT.glob("*_wbtest.mbt")):
        old.unlink()
    remotes = load_remotes()
    if remotes:
        header = [
            "// Generated remote-document registry for $ref resolution.",
            "// DO NOT EDIT - regenerate with: python tools/gen_suite.py",
            "",
        ]
        (OUT / "remotes.mbt").write_text(
            "\n".join(header + map_literal(remotes)) + "\n", encoding="utf-8"
        )
    total_cases = 0
    total_files = 0
    for base in sorted(os.listdir(FIXTURES)):
        if not base.endswith(".json") or base in EXCLUDE or ".." in base:
            continue
        stem = base[: -len(".json")]
        groups = json.loads((FIXTURES / base).read_text(encoding="utf-8"))
        lines = [
            "// Generated from JSON-Schema-Test-Suite tests/draft2020-12/%s" % base,
            "// (vendored copy in suite/fixtures/%s, MIT License)" % base,
            "// DO NOT EDIT - regenerate with: python tools/gen_suite.py",
            "",
        ]
        seen = set()
        cases = 0
        for gi, group in enumerate(groups):
            gdesc = sanitize(group.get("description", ""))
            for ti, case in enumerate(group["tests"]):
                cdesc = sanitize(case.get("description", ""))
                if (base, case.get("description", "")) in EXCLUDE_CASES:
                    continue
                name = "%s [g%d] %s - %s" % (stem, gi, gdesc, cdesc)
                if name in seen:
                    name += " #%d" % ti
                seen.add(name)
                lines.append('test "%s" {' % name)
                lines.append("  let schema = @json.parse(%s)" % literal(group["schema"]))
                lines.append("  let data = @json.parse(%s)" % literal(case["data"]))
                lines.append(
                    '  inspect(@jsonschema.validate_with_docs(schema, data, docs()) is Ok(_), content="%s")'
                    % ("true" if case["valid"] else "false")
                )
                lines.append("}")
                lines.append("")
                cases += 1
        (OUT / (stem + "_wbtest.mbt")).write_text("\n".join(lines), encoding="utf-8")
        total_cases += cases
        total_files += 1
        print("%-32s %4d cases" % (stem, cases))
    print("---")
    print("%d files, %d cases -> %s" % (total_files, total_cases, OUT))


if __name__ == "__main__":
    main()
