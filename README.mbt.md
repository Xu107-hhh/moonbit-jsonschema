# moonbit-jsonschema

[![CI](https://github.com/Xu107-hhh/moonbit-jsonschema/actions/workflows/ci.yml/badge.svg)](https://github.com/Xu107-hhh/moonbit-jsonschema/actions/workflows/ci.yml)

A **standards-compliant JSON Schema (2020-12) validator** for MoonBit.
It reads standard JSON Schema documents and validates JSON instances
against them, reporting every failure with its exact location as a
JSON Pointer (RFC 6901).

moonbit-jsonschema 是 MoonBit 实现的 **JSON Schema 2020-12 标准符合性验证器**：
输入标准 JSON Schema 文档，对 JSON 数据做校验，所有错误均带精确到
JSON Pointer（RFC 6901）的实例路径与 schema 路径，并一次收集全部错误。

**官方测试套件通过率：1305 / 1308（99.8%）** —— 见下文 [Conformance](#conformance--标准符合性)。

## Why / 为什么做这个

AI 编程时代，LLM 的结构化输出需要严格的 schema 校验。MoonBit 生态已有
构造器风格的运行时校验库（如 [moon_zod](https://github.com/Betterlol/moon_zod)，
Zod 风格 API，在代码里定义 schema）；本项目补上另一半：**校验以文档形式
存在的 schema** —— 来自 OpenAPI 描述、工具配置、或由大模型直接返回的
JSON Schema 文档。两者定位互补。

典型场景：

1. **LLM 结构化输出校验** —— 模型返回的 JSON 先对照其工具的参数 schema
   校验，全部通过才执行；失败时把错误列表拼回 prompt 让模型自修正。
2. **Web 服务请求体检查** —— handler 入口对照 OpenAPI 组件 schema 校验，
   不合法直接 400 并返回具体错误路径（如 `/users/0/age 应为整数`）。
3. **配置文件检查** —— 工具启动时对照 schema 校验配置，一次报出所有
   问题；编译为 WASM 后可嵌入网页做表单校验。

## Conformance / 标准符合性

集成官方 [JSON-Schema-Test-Suite](https://github.com/json-schema-org/JSON-Schema-Test-Suite)
（draft 2020-12，非 optional 用例，已 vendor 到 `suite/fixtures`，MIT）：

| 指标 | 结果 |
|---|---|
| 测试用例 | **1305 / 1308 通过（99.8%）** |
| 失败 | 3 例，均为「用官方元 schema 验证 schema 本身」的场景（见下） |

关键字覆盖：type / enum / const / 全部数值与字符串约束 /
items / prefixItems / uniqueItems / contains(+min/maxContains) /
properties / patternProperties / additionalProperties / required /
propertyNames / dependentRequired / dependentSchemas /
allOf / anyOf / oneOf / not / if-then-else /
unevaluatedProperties / unevaluatedItems /
$ref / $defs / $anchor / $id（含嵌套 $id 与相对 URI 解析）/
$dynamicAnchor / $dynamicRef / 多文件 schema（`validate_with_docs`）。

**已知限制**（诚实记录）：

- 官方元 schema（`https://json-schema.org/draft/2020-12/schema`）被当作
  恒真 —— 本库不验证 schema 文档自身的有效性，因此套件中 3 个
  「无效 schema 应被拒绝」的用例失败；
- `format` 按 2020-12 默认语义不参与断言（仅注解）；
- 外部 URI 引用不联网获取 —— 通过 `validate_with_docs` 显式传入文档；
- 超出双精度的大整数精度受 `Number` 表示限制。

套件的 `refRemote.json`（需真实 HTTP 服务器）未纳入生成。

## Usage / 用法

```moonbit nocheck
let schema = @json.parse("{\"type\": \"integer\", \"minimum\": 0}")
let instance = @json.parse("42")
inspect(@jsonschema.is_valid(schema, instance), content="true")
```

收集全部错误（带精确路径）：

```moonbit nocheck
match @jsonschema.validate(schema, instance) {
  Ok(_) => // valid
  Err(errors) =>
    for e in errors {
      // e.instance_path: "/users/0/age"
      // e.schema_path:   "#/properties/users/items/properties/age/type"
      // e.keyword:       "type"
      // e.message:       "expected integer, got string"
    }
}
```

文本直入（自动区分解析错误与校验错误）：

```moonbit nocheck
match @jsonschema.validate_json(schema_text, instance_text) { ... }
```

多文件 schema（外部 `$ref` 不联网，显式注册文档）：

```moonbit nocheck
let docs : Map[String, Json] = Map([])
docs.set("https://example.com/defs.json", @json.parse(defs_text))
@jsonschema.validate_with_docs(schema, instance, docs)
```

CLI：

```bash
$ moon run cmd/main -- "$(cat schema.json)" "$(cat instance.json)"
invalid at /age: -1 is less than minimum 0 (minimum at #/properties/age/minimum)
```

## Development

Requires the [MoonBit toolchain](https://www.moonbitlang.com/download/) (`moon`).

```bash
moon check        # static checks
moon fmt          # format
moon test         # unit tests + full official conformance suite
moon run cmd/main # run the CLI
python tools/gen_suite.py  # regenerate suite tests from fixtures
```

## Project layout

- `*.mbt` — validator core (one file per keyword family)
- `cmd/main` — CLI
- `suite/fixtures` — vendored official test suite (MIT, JSON-Schema-Test-Suite)
- `suite/remotes` — vendored HTTP remotes for external-$ref cases (MIT)
- `suite/gen` — generated conformance tests (`tools/gen_suite.py`)
- `tools/gen_suite.py` — test generator

## License

Apache-2.0. Test fixtures under `suite/` are from
[JSON-Schema-Test-Suite](https://github.com/json-schema-org/JSON-Schema-Test-Suite)
(MIT License). Regex support via [moonbitlang/regexp](https://mooncakes.io/docs/moonbitlang/regexp/).
