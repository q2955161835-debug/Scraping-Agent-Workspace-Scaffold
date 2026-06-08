param(
  [string]$Root = (Get-Location).Path
)

$errors = New-Object System.Collections.Generic.List[string]

$projectMapFile = (-join ([char[]](0x9879, 0x76ee, 0x5730, 0x56fe))) + '.md'
$progressFile = (-join ([char[]](0x8fdb, 0x5c55, 0x8bb0, 0x5f55))) + '.md'
$toolsGuideFile = (-join ([char[]](0x5de5, 0x5177, 0x5e93, 0x8bf4, 0x660e))) + '.md'

foreach ($required in @(
  'AGENTS.md',
  'README.md',
  'pyproject.toml',
  '.env.example',
  "doc\$projectMapFile",
  "doc\$progressFile",
  "tools\$toolsGuideFile",
  'tools\workspace-scraping\SKILL.md',
  'tools\scripts\scaffold_project.py',
  'tools\scripts\create_variable_template.py',
  'tools\scripts\validate_workspace.py',
  "templates\standard-scraping-project\doc\$projectMapFile"
)) {
  $path = Join-Path $Root $required
  if (-not (Test-Path -LiteralPath $path)) {
    $errors.Add("missing required file: $required")
  }
}

foreach ($skill in @('scrapling', 'spreadsheets', 'markitdown-skill', 'multi-search-engine', 'external-skills-hub', 'skill-creator')) {
  $path = Join-Path $Root "tools\skills\$skill"
  if (-not (Test-Path -LiteralPath $path)) {
    Write-Output "WARN`tmissing local skill link: tools\skills\$skill; run tools\scripts\Link-Skills.ps1 to rebuild"
  }
}

$allowedRootItems = @(
  '.git',
  '.github',
  '.gitattributes',
  '.gitignore',
  '.env.example',
  'AGENTS.md',
  'README.md',
  'LICENSE',
  'pyproject.toml',
  'requirements.txt',
  'doc',
  'examples',
  'templates',
  'tests',
  'tools',
  'try'
)

$rootItems = Get-ChildItem -LiteralPath $Root -Force | Where-Object {
  $_.Name -notin $allowedRootItems -and
  -not ($_.PSIsContainer)
}

foreach ($item in $rootItems) {
  $errors.Add("unexpected root file: $($item.Name)")
}

if ($errors.Count -gt 0) {
  $errors | ForEach-Object { Write-Output "FAIL`t$_" }
  exit 1
}

Write-Output "OK`tworkspace structure check passed"
