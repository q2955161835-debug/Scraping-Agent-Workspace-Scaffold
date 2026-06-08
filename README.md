# Scraping Agent Workspace Scaffold（数据爬取 Agent 工作区脚手架）

![Scraping Agent Workspace Scaffold cover（数据爬取 Agent 工作区脚手架封面）](doc/assets/cover.png)

[English version](README.en.md)

Scraping Agent Workspace Scaffold（数据爬取 Agent 工作区脚手架）是一套面向结构化数据采集项目的工作区模板。它帮助使用者在开始爬虫之前先建立字段口径、目录边界、来源质量分级和交付验收规则，再通过内置脚本和技能快速创建可追踪、可复核、可持续维护的数据爬取项目。

这不是一个只放代码示例的爬虫仓库，而是一个完整的工作区组织方案：根目录保存项目治理制度，`scaffolding/` 保存可复用模板、脚本、技能和示例，用户自己的采集目标作为第一层子项目放在工作区根目录。

实际案例中，一个河北 2023 年各市生态环境指标项目在普通爬虫程序阶段约完成 21%，迁入本脚手架并按变量表、来源分级、归档脚本和补填审计流程整理后，主表覆盖率提升到 98/143（68.53%，约 69%）。

## 适合谁使用

- 需要同时管理多个数据采集目标的研究者、数据分析师和自动化工程师。
- 需要让 `Agent`（代理）按固定流程完成字段确认、渠道拆分、抓取、清洗和交付的团队。
- 需要保留来源链接、质量等级、采集时间和核验状态的数据项目。
- 需要把网页抓取、文档提取、表格交付和进展记录放进统一工作区的人。
- 需要一个可以直接上传到 GitHub（代码托管平台）并持续维护的采集项目模板。

## 核心理念

### 先建模，再爬取

数据爬取的第一步不是写爬虫，而是建立变量确认表。变量确认表至少包含变量名、字段含义、单位、数据类型、来源优先级、是否必填、清洗规则、可接受缺失条件和备注。字段口径确认后，再进入采集和清洗阶段。

### 制度和执行分离

工作区管理制度位于根目录 [AGENTS.md](AGENTS.md)。它规定所有项目必须遵守的目录、质量、备份、进展和验收规则。

具体执行工作流位于 [scaffolding/tools/workspace-scraping/SKILL.md](scaffolding/tools/workspace-scraping/SKILL.md)。它把根目录制度落地为可执行步骤，包括创建子项目、生成变量确认表、选择抓取方式、组织数据文件和验收交付。

### 任务清单防重复

每个子项目默认维护 `doc/任务清单.md`，记录任务编号、子 `Agent`（代理）、来源等级、变量、目标 URL（统一资源定位符）或文件、去重键、状态、输出位置和失败项。派遣前先查任务清单，已完成且可复用的页面不重复爬取，失败或需复核的页面保留重试原因。

### 提示词模板注入

多子 `Agent`（代理）任务使用 [subagent-prompt-templates.md](scaffolding/tools/workspace-scraping/references/subagent-prompt-templates.md) 中的模板。官方源、官方新闻、第三方新闻、文献提取、逆向计算、弱来源核验和汇总任务各自有独立模板，派遣时按任务目标注入，避免不同来源等级混在同一提示词里。

### Scrapling 优先

`Scrapling`（网页抓取库）是本工作区的网页采集核心。脚手架内置 `Scrapling`（网页抓取库）技能和示例，并按目标复杂度递进使用：

1. `Fetcher`（基础抓取器）：静态页面。
2. `DynamicFetcher`（动态抓取器）：需要 JavaScript（脚本）渲染的页面。
3. `StealthyFetcher`（隐身抓取器）：目标行为确实需要隐身访问时使用。
4. `Spider`（爬虫框架）：分页、并发、断点续跑或大批量页面。

## 仓库结构

```text
.
├─ AGENTS.md
├─ README.md
├─ .env.example
├─ .gitignore
├─ doc/
│  ├─ 项目地图.md
│  ├─ 进展记录.md
│  └─ assets/
│     └─ cover.png
├─ scaffolding/
│  ├─ README.md
│  ├─ AGENTS.md
│  ├─ examples/
│  ├─ templates/
│  ├─ tests/
│  └─ tools/
│     ├─ scripts/
│     ├─ skills/
│     └─ workspace-scraping/
├─ 目标项目A/
├─ 目标项目B/
└─ try/
```

## 目录职责

### 工作区根目录

| 路径 | 用途 |
| --- | --- |
| `AGENTS.md` | 工作区级管理制度主入口 |
| `README.md` | 面向使用者的项目说明 |
| `doc/项目地图.md` | 长期维护索引、目录职责、核心入口和环境概况 |
| `doc/进展记录.md` | 阶段性进展记录；发布模板时可保持为空 |
| `.env.example` | 环境变量示例账本，只放占位值和说明 |
| `.gitignore` | 忽略真实环境变量、缓存和临时文件 |
| `scaffolding/` | 可复用脚手架能力目录 |
| `try/` | 工作区级临时验证目录，只提交空占位文件 |
| `目标项目/` | 用户自己的独立采集目标 |

### 脚手架目录

| 路径 | 用途 |
| --- | --- |
| `scaffolding/tools/workspace-scraping/SKILL.md` | 工作区爬取执行工作流 |
| `scaffolding/tools/scripts/` | 创建子项目、生成变量表、校验结构的脚本 |
| `scaffolding/tools/skills/` | 内置技能实体目录 |
| `scaffolding/templates/standard-scraping-project/` | 标准采集子项目模板 |
| `scaffolding/examples/` | `Scrapling`（网页抓取库）示例 |
| `scaffolding/tests/` | 脚手架结构测试 |
| `scaffolding/.github/workflows/` | GitHub Actions（GitHub 自动化流程）校验模板 |

## 快速开始

### 1. 克隆仓库

```powershell
git clone https://github.com/q2955161835-debug/Scraping-Agent-Workspace-Scaffold.git
cd Scraping-Agent-Workspace-Scaffold
```

### 2. 安装依赖

进入脚手架目录后安装开发和抓取依赖：

```powershell
cd .\scaffolding
python -m pip install -e .[dev,scraping]
```

如果只想检查结构，不运行真实抓取，可以先安装基础开发依赖：

```powershell
python -m pip install -e .[dev]
```

### 3. 校验脚手架

```powershell
python tools\scripts\validate_workspace.py .
.\tools\scripts\Test-ScrapingWorkspace.ps1
python -m pytest
```

### 4. 创建采集子项目

从 `scaffolding/` 目录创建一个目标项目到上一级工作区根目录：

```powershell
python tools\scripts\scaffold_project.py "示例目标数据" --root ..
```

PowerShell（微软命令行脚本）版本：

```powershell
.\tools\scripts\New-ScrapingProject.ps1 -Name "示例目标数据" -Root ..
```

### 5. 创建变量确认表

```powershell
python tools\scripts\create_variable_template.py "..\示例目标数据"
```

PowerShell（微软命令行脚本）版本：

```powershell
.\tools\scripts\New-VariableTemplate.ps1 -ProjectPath "..\示例目标数据"
```

## 标准工作流

1. 创建目标子项目。
2. 建立变量确认表。
3. 确认变量名、字段含义、单位、类型、来源优先级、必填性、清洗规则和可接受缺失条件。
4. 创建或更新 `doc/任务清单.md`，登记 URL（统一资源定位符）、文件、接口、去重键和输出位置。
5. 按来源渠道拆分子 `Agent`（代理）任务，并注入对应派遣提示词模板。
6. 使用 `Scrapling`（网页抓取库）或相关技能采集数据。
7. 将原始结构化结果放入 `原始数据/`。
8. 将下载文件、网页快照、截图、报告和 `PDF`（便携式文档格式）放入 `原始文件/`。
9. 将临时实验放入 `try/`。
10. 清洗、合并、去重并标注来源质量等级。
11. 将最新版交付数据放入对应子项目根目录。
12. 更新子项目文档和必要的工作区记录。

## 子 Agent 调度

多来源项目应使用子 `Agent`（代理）调度流程，把官方源、官方新闻、第三方新闻、文献提取、逆向计算、弱来源核验和最终汇总拆开处理。详细流程见 [scaffolding/tools/workspace-scraping/references/channel-playbook.md](scaffolding/tools/workspace-scraping/references/channel-playbook.md)。

调度手册包含：

- 何时必须派遣多个子 `Agent`（代理）。
- 调度前置输入。
- 变量到渠道的拆分方法。
- 子 `Agent`（代理）派遣提示词模板注入。
- 任务清单去重规则。
- 并行与依赖判断。
- 来源冲突处理流程。
- 必填字段缺失补采流程。
- 子 `Agent`（代理）调度表模板。

## 子项目结构

每个第一层目标目录都是独立子项目：

```text
目标项目/
├─ doc/
├─ 旧数据/
├─ 原始数据/
├─ 原始文件/
└─ try/
```

| 目录 | 用途 |
| --- | --- |
| `doc/` | 子项目文档、变量说明、采集策略和进展记录 |
| `doc/任务清单.md` | 爬取任务、URL（统一资源定位符）或文件、去重键、状态和输出位置 |
| `旧数据/` | 被替换的历史版本 |
| `原始数据/` | 原始结构化抓取结果 |
| `原始文件/` | 下载文件、网页快照、截图、报告和 `PDF`（便携式文档格式） |
| `try/` | 测试、调试和临时验证文件 |

可按需新增 `清洗数据/`、`脚本/`、`截图证据/`、`中间结果/`、`配置/`、`导出报告/` 等目录。新增目录需要在子项目 `doc/项目地图.md` 或 `doc/目录说明.md` 中说明用途、可删除性和是否承载最终数据。

## 来源质量分级

数据来源质量按以下顺序分级：

```text
官方 > 官方新闻 > 第三方新闻 > 论文 > 逆向计算 > 论坛 > 其他渠道
```

使用建议：

- 同一变量存在多个来源时，优先采用质量等级更高的来源。
- 低等级来源可作为线索、补充或异常排查依据。
- 逆向计算数据必须记录公式、输入来源、计算口径、时间范围和误差风险。
- 最终数据表应包含来源字段、质量等级字段、采集时间字段和核验状态字段。

## 内置技能

`scaffolding/tools/skills/` 提交的是技能真实文件目录，不依赖本机软连接。

| 技能目录 | 用途 |
| --- | --- |
| `scrapling` | `Scrapling`（网页抓取库）抓取策略、动态页面、反爬处理、分页和 `Spider`（爬虫框架）示例 |
| `spreadsheets` | `Excel`（表格）模板、校验表、数据整理和工作簿交付 |
| `markitdown-skill` | 文档、网页和办公文件转 Markdown（标记文本） |
| `multi-search-engine` | 多搜索引擎检索策略和可审计搜索链接 |
| `external-skills-hub` | 外部技能路由 |
| `skill-creator` | 创建或维护技能文件 |

## 案例效果

河北 2023 年各市生态环境指标项目需要整理 11 个地级市 × 13 个生态环境指标。迁入本脚手架后，项目按 `AGENTS.md` 固化规则，保留根目录唯一交付 Excel（表格），把脚本、历史表、原始材料和进展记录归档到稳定目录，并通过补填记录工作表保留审计线索。最终主表覆盖率从普通爬虫阶段约 21% 提升到 98/143（68.53%，约 69%）。

## 验收条件

一个采集项目至少应满足：

- 变量表已确认。
- 任务清单已记录去重键、状态、输出位置和失败项。
- 字段来源可追踪。
- 来源质量等级已标注。
- 最新版数据放在子项目根目录。
- 原始数据和原始文件可回溯。
- 子项目文档记录字段口径、目录扩展、采集策略和异常情况。

详细验收清单见 [scaffolding/tools/workspace-scraping/references/dataset-acceptance.md](scaffolding/tools/workspace-scraping/references/dataset-acceptance.md)。

## 环境变量

- `.env` 保存真实敏感配置，必须被 `.gitignore`（Git 忽略规则）忽略。
- `.env.example` 只保存变量名、占位值和必要说明。
- 禁止将真实密钥、`token`（令牌）、`cookie`（会话凭据）、数据库密码、私有地址写入 README（说明文档）、进展记录或可复制代码块。

## 发布模板说明

为了让公开仓库保持干净：

- `doc/项目地图.md` 可作为长期维护说明随仓库发布。
- `doc/进展记录.md` 可保持为空文件，由使用者在自己的项目中开始记录。
- `try/` 只提交空占位文件，实际调试内容不上传。

## 许可证

本项目使用 [MIT License（麻省理工许可证）](scaffolding/LICENSE)。
