param(
  [Parameter(Mandatory = $true)]
  [string]$Name,

  [string]$Root = (Get-Location).Path,

  [string[]]$ExtraFolders = @()
)

$projectPath = Join-Path $Root $Name
if (Test-Path -LiteralPath $projectPath) {
  throw "项目已存在：$projectPath"
}

$defaultFolders = @('doc', '旧数据', '原始数据', '原始文件', 'try')
$allFolders = @($defaultFolders + $ExtraFolders | Where-Object { $_ } | Select-Object -Unique)

New-Item -ItemType Directory -Path $projectPath -Force | Out-Null
foreach ($folder in $allFolders) {
  New-Item -ItemType Directory -Path (Join-Path $projectPath $folder) -Force | Out-Null
}

$now = Get-Date -Format 'yyyy-MM-dd HH:mm'

@"
# 项目地图

## 目标
- 待填写：本子项目爬取目标、数据范围和交付格式。

## 目录
- `doc/`：项目规则、进展记录、目录说明、变量表说明、采集策略。
- `doc/任务清单.md`：爬取任务、URL（统一资源定位符）或文件、去重键、状态、输出位置和失败项。
- `旧数据/`：历史版本数据。
- `原始数据/`：原始结构化抓取结果。
- `原始文件/`：下载文件、网页快照、报告、截图等。
- `try/`：测试、调试、临时验证文件。

## 扩展目录
- 待填写：新增目录的用途、可删除性、是否承载最终数据。
"@ | Set-Content -Path (Join-Path $projectPath 'doc\项目地图.md') -Encoding UTF8

@"
# 目录说明

## 默认目录
- `doc/`：不可随意删除，保存项目文档。
- `旧数据/`：不可随意删除，保存历史版本。
- `原始数据/`：不可随意删除，保存原始结构化数据。
- `原始文件/`：不可随意删除，保存原始文件证据。
- `try/`：可清理，保存测试和临时验证内容。

## 扩展目录
- 待填写。
"@ | Set-Content -Path (Join-Path $projectPath 'doc\目录说明.md') -Encoding UTF8

@"
# 进展记录

## $now ~ $now
- 本阶段完成内容：创建子项目目录骨架。
- 新增/修改/生成的文件清单与用途说明：
  - `doc/项目地图.md`：记录子项目目标和目录职责。
  - `doc/目录说明.md`：记录默认目录与扩展目录管理规则。
  - `doc/任务清单.md`：记录爬取任务、页面去重键和子 Agent（代理）输出状态。
  - `doc/进展记录.md`：记录子项目阶段进展。
- 错误汇报：无。
"@ | Set-Content -Path (Join-Path $projectPath 'doc\进展记录.md') -Encoding UTF8

@'
# 任务清单

本文件记录不同爬取任务、页面、附件和子 `Agent`（代理）输出状态，用于避免同一网页或同一来源被重复爬取。

## 使用规则

- 正式采集前先登记任务范围和去重键。
- 每个 URL（统一资源定位符）、附件、接口或文献文件至少保留一行任务记录。
- 相同 URL（统一资源定位符）但字段、时间范围或参数不同，可以拆成多行，并在“去重键”中写清差异。
- 子 `Agent`（代理）完成后更新状态、输出位置、失败项和下一步。
- 临时验证只放在 `try/`，不写入正式任务清单。

## 状态枚举

```text
待执行
执行中
已完成
需复核
已跳过
失败
```

## 任务总表

| 任务编号 | 子 Agent | 来源等级 | 变量 | 目标 URL 或文件 | 去重键 | 状态 | 输出位置 | 失败项 | 下一步 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| T001 | 官方源子 Agent | 官方 | 待填写 | 待填写 | 待填写 | 待执行 | 待填写 | 无 | 待填写 |

## 页面去重记录

| 去重键 | URL 或文件 | 首次登记时间 | 最近处理时间 | 处理次数 | 当前状态 | 备注 |
| --- | --- | --- | --- | --- | --- | --- |
| 待填写 | 待填写 | 待填写 | 待填写 | 0 | 待执行 | 待填写 |

## 子 Agent 输出登记

| 子 Agent | 任务编号 | 输出文件 | 来源质量等级 | 核验状态 | 汇总状态 | 备注 |
| --- | --- | --- | --- | --- | --- | --- |
| 待填写 | T001 | 待填写 | 待填写 | 待填写 | 未汇总 | 待填写 |
'@ | Set-Content -Path (Join-Path $projectPath 'doc\任务清单.md') -Encoding UTF8

Write-Output $projectPath
