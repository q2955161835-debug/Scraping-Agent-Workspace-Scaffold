# Scraping Agent Workspace Scaffold（数据爬取 Agent 工作区脚手架）

一个面向数据爬取任务的 AI（人工智能）工作区脚手架。它把 `AGENTS.md`（代理说明文件）、Scrapling（网页抓取库）、变量确认表、渠道子代理分工、质量分级、模板项目和校验脚本组合成可复用的数据采集起点。

当前仓库采用“工作区外壳包裹脚手架”的结构时，本目录就是独立脚手架；实际数据子项目位于上一级工作区根目录。

## 适用场景

- 为一个新数据目标快速创建标准爬取子项目。
- 在正式爬虫前先生成变量确认表，避免字段口径反复变更。
- 按来源质量派遣子 `agent`（代理）：官方、新闻、论文、逆向计算、论坛等。
- 派遣子 `agent`（代理）前注入来源等级对应的提示词模板。
- 用 `doc/任务清单.md` 登记 URL（统一资源定位符）、文件、去重键、状态和输出位置，避免重复爬取。
- 使用 Scrapling（网页抓取库）的 `Fetcher`（基础抓取器）、`DynamicFetcher`（动态抓取器）、`StealthyFetcher`（隐身抓取器）和 `Spider`（爬虫框架）建立可扩展采集流程。
- 将原始数据、原始文件、旧数据、最新版数据和项目文档放到稳定位置。

## 快速开始

```powershell
git clone https://github.com/q2955161835-debug/Scraping-Agent-Workspace-Scaffold.git
cd Scraping-Agent-Workspace-Scaffold
cd scaffolding
python -m pip install -e .[dev,scraping]
python tools/scripts/scaffold_project.py "示例目标数据" --root ..
python tools/scripts/create_variable_template.py "../示例目标数据"
python tools/scripts/validate_workspace.py .
```

Windows（微软视窗系统）也可以使用 PowerShell（微软命令行脚本）版本：

```powershell
.\tools\scripts\New-ScrapingProject.ps1 -Name "示例目标数据" -Root ..
.\tools\scripts\New-VariableTemplate.ps1 -ProjectPath "..\示例目标数据"
.\tools\scripts\Test-ScrapingWorkspace.ps1
```

若在当前工作区外壳内调用 PowerShell（微软命令行脚本）脚本，先进入 `scaffolding/`，并把子项目根目录参数指向上一级工作区。

## 核心目录

- `AGENTS.md`：工作区级规则入口。
- `doc/`：工作区项目地图和进展记录。
- `tools/`：工具库，包含技能实体目录、复用脚本和工作区专用技能。
- `templates/standard-scraping-project/`：标准爬取子项目模板。
- `examples/`：Scrapling（网页抓取库）最小示例。
- `.github/workflows/validate.yml`：GitHub Actions（GitHub 自动化流程）结构校验。

## 标准流程

1. 创建目标子项目。
2. 生成变量确认表。
3. 用户确认变量表。
4. 建立任务清单，登记去重键、状态和输出位置。
5. 按渠道分派子 `agent`（代理），并注入对应提示词模板。
6. 使用 Scrapling（网页抓取库）采集数据。
7. 原始结果归档到 `原始数据/` 或 `原始文件/`。
8. 清洗、合并、去重、质量分级。
9. 将最新版数据放入子项目根目录。

详细规则见 [AGENTS.md](AGENTS.md)；工具库细则见 [tools/工具库说明.md](tools/%E5%B7%A5%E5%85%B7%E5%BA%93%E8%AF%B4%E6%98%8E.md)。

## 数据质量分级

官方 > 官方新闻 > 第三方新闻 > 论文 > 各种渠道逆向计算出的数据 > 论坛 > 其他渠道。

## Scrapling 示例

- [examples/basic_fetcher.py](examples/basic_fetcher.py)：静态页面抓取。
- [examples/dynamic_fetcher.py](examples/dynamic_fetcher.py)：需要 JavaScript（脚本）渲染的页面。
- [examples/spider_template.py](examples/spider_template.py)：分页或批量采集模板。

## 发布状态

目标仓库：<https://github.com/q2955161835-debug/Scraping-Agent-Workspace-Scaffold>

当前工作区根目录名：`数据爬取 Agent 工作区脚手架`。
