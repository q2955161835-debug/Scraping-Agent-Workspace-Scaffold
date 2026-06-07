param(
  [string]$Root = (Get-Location).Path
)

$errors = New-Object System.Collections.Generic.List[string]

foreach ($required in @('AGENTS.md', 'doc\项目地图.md', 'doc\进展记录.md', 'tools\工具库说明.md', 'tools\workspace-scraping\SKILL.md')) {
  $path = Join-Path $Root $required
  if (-not (Test-Path -LiteralPath $path)) {
    $errors.Add("缺少必需文件：$required")
  }
}

foreach ($skill in @('scrapling', 'spreadsheets', 'markitdown-skill', 'multi-search-engine', 'external-skills-hub', 'skill-creator')) {
  $path = Join-Path $Root "tools\skills\$skill"
  if (-not (Test-Path -LiteralPath $path)) {
    $errors.Add("缺少技能软连接：tools\skills\$skill")
  }
}

$rootItems = Get-ChildItem -LiteralPath $Root -Force | Where-Object {
  $_.Name -notin @('.git', '.gitignore', '.env.example', 'AGENTS.md', 'doc', 'tools') -and
  -not ($_.PSIsContainer)
}

foreach ($item in $rootItems) {
  $errors.Add("根目录存在非工作区级文件：$($item.Name)")
}

if ($errors.Count -gt 0) {
  $errors | ForEach-Object { Write-Output "FAIL`t$_" }
  exit 1
}

Write-Output "OK`t工作区结构检查通过"
