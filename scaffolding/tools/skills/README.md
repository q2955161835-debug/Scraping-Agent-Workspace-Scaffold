# Skills Library（技能库）

本目录提交常用 `skill`（技能）的真实文件目录，避免其他机器 clone（克隆）后出现本机绝对路径软连接失效。

## 当前包含

- `external-skills-hub`
- `markitdown-skill`
- `multi-search-engine`
- `scrapling`
- `skill-creator`
- `spreadsheets`

## 维护要求

- 更新技能目录前先确认来源路径可信。
- 上传前扫描真实密钥、`token`（令牌）、`cookie`（会话凭据）等敏感信息。
- `tools/scripts/Link-Skills.ps1` 是旧版软连接重建脚本；当前仓库默认提交真实技能目录。
