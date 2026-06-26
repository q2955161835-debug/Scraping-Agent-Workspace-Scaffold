# tasks — 数据爬取子项目

本目录统一存放数据爬取目标子项目。每个子项目按目标命名，包含标准目录结构和验收文档。

## 当前子项目

| 目录 | 目标 | 状态 | 主要产物 |
| --- | --- | --- | --- |
| `6-12-100/` | 河北生态环境指标数据采集 | 已完成主体采集 | `latest.xlsx`、`latest.csv`、清洗过程文件、变量确认表 |
| `agent-reach/` | Agent 触达整合子项目 | 占位待导入 | 整合说明、任务清单 |

## 子项目标准结构

```
目标项目/
├── 最新版数据文件（latest.xlsx / latest.csv / latest.jsonl）
├── doc/
│   ├── 项目地图.md
│   ├── 验收标准.md
│   ├── 任务清单.md
│   ├── 变量确认表.csv
│   ├── 采集策略.md
│   └── 进展记录/
├── 原始数据/
├── 原始文件/
├── 旧数据/
└── try/
```

## 创建新子项目

```powershell
python scaffolding/tools/scripts/scaffold_project.py "目标项目名" --root .
```
