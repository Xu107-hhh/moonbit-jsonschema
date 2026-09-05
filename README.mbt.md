# moonbit-jsonschema

[![CI](https://github.com/Xu107-hhh/moonbit-jsonschema/actions/workflows/ci.yml/badge.svg)](https://github.com/Xu107-hhh/moonbit-jsonschema/actions/workflows/ci.yml)

A **standards-compliant JSON Schema (2020-12) validator** for MoonBit, with precise error paths and full error collection.

MoonBit 实现的 **JSON Schema 2020-12 标准符合性验证器**：输入标准 JSON Schema 文档，输出精确到 JSON Pointer 的验证错误。

## Why / 为什么做这个

AI 编程时代，LLM 的结构化输出需要严格的 JSON Schema 校验。MoonBit 生态已有构造器（builder）风格的运行时校验库（如 [moon_zod](https://github.com/Betterlol/moon_zod)，Zod 风格 API），但缺少一个：

- **吃标准 JSON Schema 文档**的验证器——schema 以数据形式存在（来自 API、配置或模型输出），而不是代码里构造
- **对齐最新 2020-12 草案**的实现——含 `$dynamicRef`、`prefixItems`、`unevaluatedProperties` 等新关键字
- **可量化的一致性**——集成官方 [JSON-Schema-Test-Suite](https://github.com/json-schema-org/JSON-Schema-Test-Suite) 并公开各关键字通过率

本项目与 moon_zod 定位互补：它服务"代码内定义 schema"的场景，本项目服务"校验任意标准 schema 文档"的场景。

## Status / 状态

🚧 Work in progress for the [MoonBit September Hackathon 2026](https://moonbitlang.github.io/Hackathon2026/) (deadline 2026-09-24).

- [x] 项目骨架、CI、测试基建
- [ ] JSON Pointer (RFC 6901) 工具
- [ ] 核心验证关键字（type / enum / required / properties / items …）
- [ ] 组合关键字（allOf / anyOf / oneOf / not）
- [ ] `$ref` / `$defs` 引用解析
- [ ] 2020-12 新关键字（`$dynamicRef` / `prefixItems` / `unevaluatedProperties`）
- [ ] 官方测试套件集成与通过率报告
- [ ] 错误信息：JSON Pointer 精确路径 + 全量错误收集
- [ ] WASM 构建

## Usage / 用法

```moonbit nocheck
// TODO: after core validator lands
```

```bash
$ moon run cmd/main
moonbit-jsonschema v0.1.0
```

## Development

Requires the [MoonBit toolchain](https://www.moonbitlang.com/download/) (`moon`).

```bash
moon check        # static checks
moon fmt          # format
moon test         # run tests
moon run cmd/main # run the CLI
```

## License

Apache-2.0
