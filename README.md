# 数据爬取 Agent 工作区

当前目录是实际数据爬取工作区外壳，脚手架已拆分到根目录下的 `脚手架/`。

## 当前结构

- `AGENTS.md`：工作区外壳规则入口。
- `doc/`：工作区项目地图和进展记录。
- `脚手架/`：独立脚手架，包含 `Scrapling`（网页抓取库）示例、模板、脚本、测试和工作区专用技能。
- `agent-reach/`：已预留的整合子项目目录，等待导入原始项目内容。
- `try/`：工作区级临时验证目录。

## 常用入口

```powershell
cd .\脚手架
python tools\scripts\validate_workspace.py .
python tools\scripts\scaffold_project.py "示例目标数据" --root ..
python tools\scripts\create_variable_template.py "..\示例目标数据"
```

系统 `python.exe`（Python 解释器）不可用时，可改用 Codex（代码代理）内置 Python（Python 语言）路径执行同样命令。
