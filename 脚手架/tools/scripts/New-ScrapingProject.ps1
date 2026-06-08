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
  - `doc/进展记录.md`：记录子项目阶段进展。
- 错误汇报：无。
"@ | Set-Content -Path (Join-Path $projectPath 'doc\进展记录.md') -Encoding UTF8

Write-Output $projectPath
