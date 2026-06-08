# 数据爬取 Agent 工作区

![数据爬取 Agent 工作区封面](doc/assets/cover.png)

这是一个面向数据爬取、数据整理、字段建模、来源质量分级和最终数据交付的 `Agent`（代理）工作区。当前仓库不是单纯的脚手架模板，而是“工作区本体 + 内置脚手架能力”的组合：根目录负责管理制度和真实子项目，`脚手架/` 负责可复用模板、脚本、技能和示例。

## 先回答两个关键问题

### 工作区的管理制度在哪里

工作区管理制度在根目录 [AGENTS.md](AGENTS.md)。这是当前工作区的最高优先级制度入口，包含：

- 回复与协作规则。
- `Git`（版本控制）与备份规则。
- 进展记录规则。
- 项目地图与环境账本规则。
- 根目录、脚手架目录和子项目目录职责。
- 数据质量分级。
- 爬取前变量建模。
- 子 `Agent`（代理）分工。
- `Scrapling`（网页抓取库）核心准则。
- 验收要求。

也就是说，制度没有被移动到脚手架里。根目录仍然是工作区本体，根目录 `AGENTS.md` 仍然是管理制度主文件。

### 工作流是不是放在脚手架里

执行工作流的细则放在 [脚手架/tools/workspace-scraping/SKILL.md](脚手架/tools/workspace-scraping/SKILL.md)。它不是替代根目录制度，而是把根目录制度落地成可执行步骤：

- 创建目标子项目。
- 生成变量确认表。
- 按来源质量拆分渠道。
- 选择 `Scrapling`（网页抓取库）抓取方式。
- 组织原始数据、原始文件、临时验证和最新版数据。
- 执行交付前验收。

这种拆分是为了避免重复规则：根目录写“必须遵守什么”，脚手架技能写“具体怎么执行”。

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
├─ 脚手架/
│  ├─ README.md
│  ├─ AGENTS.md
│  ├─ examples/
│  ├─ templates/
│  ├─ tests/
│  └─ tools/
│     ├─ scripts/
│     ├─ skills/
│     └─ workspace-scraping/
├─ agent-reach/
└─ try/
```

## 根目录职责

根目录是工作区本体，只放工作区级文件、工作区级文档、内置脚手架、目标子项目和临时验证目录。

| 路径 | 职责 |
| --- | --- |
| `AGENTS.md` | 工作区管理制度主入口 |
| `README.md` | GitHub（代码托管平台）展示说明 |
| `doc/项目地图.md` | 长期维护索引、目录职责、核心入口和环境概况 |
| `doc/进展记录.md` | 阶段性任务记录、异常记录和高风险操作记录 |
| `.env.example` | 环境变量假账本，只放占位和说明 |
| `.gitignore` | 忽略 `.env`、缓存、临时目录等不应提交内容 |
| `脚手架/` | 内置可复用脚手架能力目录 |
| `agent-reach/` | 已预留的整合子项目入口 |
| `try/` | 工作区级测试、调试、临时验证目录 |

## 脚手架职责

`脚手架/` 是可复用能力目录，不是具体爬取子项目。它承载可复制、可测试、可发布的工作区能力。

| 路径 | 职责 |
| --- | --- |
| `脚手架/README.md` | 脚手架自身说明 |
| `脚手架/AGENTS.md` | 脚手架模板规则，复制或独立发布时使用 |
| `脚手架/tools/workspace-scraping/SKILL.md` | 工作区爬取执行技能 |
| `脚手架/tools/scripts/` | 子项目创建、变量表生成、结构校验脚本 |
| `脚手架/tools/skills/` | 已实体化提交的常用技能目录 |
| `脚手架/templates/standard-scraping-project/` | 标准目标子项目模板 |
| `脚手架/examples/` | `Scrapling`（网页抓取库）示例 |
| `脚手架/tests/` | 脚手架结构测试 |
| `脚手架/.github/workflows/` | GitHub Actions（GitHub 自动化流程）校验模板 |

## 标准数据爬取流程

1. 创建目标子项目。
2. 先建立变量确认表。
3. 用户确认变量名、字段含义、单位、类型、来源优先级、必填性、清洗规则和可接受缺失条件。
4. 按来源渠道拆分子 `Agent`（代理）任务。
5. 优先使用 `Scrapling`（网页抓取库）进行网页采集。
6. 原始结构化结果进入 `原始数据/`。
7. 下载文件、网页快照、截图、报告、`PDF`（便携式文档格式）进入 `原始文件/`。
8. 临时实验进入 `try/`。
9. 清洗、合并、去重、质量分级。
10. 最新版交付数据放入对应子项目根目录。
11. 更新子项目进展记录和必要的工作区进展记录。

## 来源质量分级

数据来源质量按以下顺序分级：

```text
官方 > 官方新闻 > 第三方新闻 > 论文 > 逆向计算 > 论坛 > 其他渠道
```

处理原则：

- 同一变量有多个来源时，优先采用质量等级更高的来源。
- 低等级来源可作为线索、补充或异常排查依据。
- 逆向计算数据必须记录公式、输入来源、计算口径、时间范围和误差风险。
- 最终数据表应包含来源字段、质量等级字段、采集时间字段和核验状态字段。

## 子项目默认结构

每个第一层目标目录都是独立子项目，例如 `agent-reach/`、`某平台商品数据/`、`某城市招投标数据/`。

```text
目标项目/
├─ doc/
├─ 旧数据/
├─ 原始数据/
├─ 原始文件/
└─ try/
```

默认目录含义：

- `doc/`：子项目文档、变量表说明、采集策略、进展记录。
- `旧数据/`：被替换的历史版本。
- `原始数据/`：原始结构化抓取结果。
- `原始文件/`：下载文件、网页快照、截图、报告、`PDF`（便携式文档格式）等证据材料。
- `try/`：测试、调试、临时验证文件，清空后不应影响项目结果。

可按需新增 `清洗数据/`、`脚本/`、`截图证据/`、`中间结果/`、`配置/`、`导出报告/` 等目录，但必须在该子项目 `doc/项目地图.md` 或 `doc/目录说明.md` 中说明用途、可删除性和是否承载最终数据。

## 快速开始

### 克隆仓库

```powershell
git clone https://github.com/q2955161835-debug/Scraping-Agent-Workspace-Scaffold.git
cd Scraping-Agent-Workspace-Scaffold
```

### 校验脚手架

```powershell
cd .\脚手架
python tools\scripts\validate_workspace.py .
.\tools\scripts\Test-ScrapingWorkspace.ps1
python -m pytest
```

如果系统 `python.exe`（Python 解释器）不可用，可以改用明确的 Python（Python 语言）可执行文件路径。

### 创建目标子项目

从 `脚手架/` 内创建目标项目到上一级工作区根目录：

```powershell
python tools\scripts\scaffold_project.py "示例目标数据" --root ..
python tools\scripts\create_variable_template.py "..\示例目标数据"
```

Windows（微软视窗系统）也可以使用 PowerShell（微软命令行脚本）版本：

```powershell
.\tools\scripts\New-ScrapingProject.ps1 -Name "示例目标数据" -Root ..
.\tools\scripts\New-VariableTemplate.ps1 -ProjectPath "..\示例目标数据"
```

## 内置技能目录

`脚手架/tools/skills/` 已不再使用本机软连接，而是提交真实文件目录，方便 GitHub（代码托管平台）克隆后直接阅读和复用。

| 技能目录 | 用途 |
| --- | --- |
| `scrapling` | `Scrapling`（网页抓取库）抓取策略、动态页面、反爬处理、分页和 `Spider`（爬虫框架）示例 |
| `spreadsheets` | `Excel`（表格）模板、校验表、数据整理和工作簿交付 |
| `markitdown-skill` | 文档、网页和办公文件转 Markdown（标记文本） |
| `multi-search-engine` | 多搜索引擎检索策略和可审计搜索链接 |
| `external-skills-hub` | 外部技能路由 |
| `skill-creator` | 创建或维护技能文件 |

## Scrapling 核心准则

本工作区不能把 `Scrapling`（网页抓取库）从主流程中移除。采集方式按目标复杂度递进：

1. `Fetcher`（基础抓取器）：静态页面。
2. `DynamicFetcher`（动态抓取器）：需要 JavaScript（脚本）渲染的页面。
3. `StealthyFetcher`（隐身抓取器）：目标行为确实需要隐身访问时使用。
4. `Spider`（爬虫框架）：10 页以上、分页、并发、断点或恢复场景。

每次选择抓取方式时，应在子项目 `doc/采集策略.md` 中记录选择原因、失败信号、重试策略和来源质量等级。

## agent-reach 整合状态

`agent-reach/` 已作为工作区子项目入口创建，但原始 `agent-reach`（代理触达项目）源目录尚未导入。当前状态记录在：

- [agent-reach/doc/项目地图.md](agent-reach/doc/项目地图.md)
- [agent-reach/doc/整合说明.md](agent-reach/doc/整合说明.md)
- [agent-reach/doc/进展记录.md](agent-reach/doc/进展记录.md)

后续导入原项目代码、文档或数据时，需要按子项目目录职责分类放置，并继续保留 `Scrapling`（网页抓取库）优先的采集流程。

## 进展与验收

工作区级进展记录：

- [doc/进展记录.md](doc/进展记录.md)

长期项目地图：

- [doc/项目地图.md](doc/项目地图.md)

脚手架验收清单：

- [脚手架/tools/workspace-scraping/references/dataset-acceptance.md](脚手架/tools/workspace-scraping/references/dataset-acceptance.md)

最低验收条件：

- 变量表已确认。
- 字段来源可追踪。
- 质量等级已标注。
- 最新版数据位置符合目录分类规则。
- 原始数据和原始文件可回溯。
- 进展记录包含阶段性任务、文件清单和异常说明。

## GitHub 上传状态

当前仓库已上传到 GitHub（代码托管平台）：

<https://github.com/q2955161835-debug/Scraping-Agent-Workspace-Scaffold>

最近结构调整已完成：

- 根目录明确为工作区本体。
- `脚手架/` 独立承载可复用脚手架能力。
- `脚手架/tools/skills/` 中的技能已由软连接替换为真实文件目录。
- 封面图已保存到 `doc/assets/cover.png` 并在本 README（说明文档）顶部引用。

## 维护原则

- 制度写在根目录 `AGENTS.md`，执行细则写在脚手架技能，不重复造规则。
- 子项目只写自己的字段口径、采集策略、目录扩展和例外说明。
- `.env` 是真实环境变量账本，禁止提交。
- `.env.example` 是假账本，只写变量名、占位值和必要说明。
- 禁止将真实密钥、`token`（令牌）、`cookie`（会话凭据）、数据库密码、私有地址写入说明文档、进展记录或聊天可复制代码块。
