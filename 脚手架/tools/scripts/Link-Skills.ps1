$links = @(
  @{ Name = 'scrapling'; Target = 'D:\2Folder\skills\scrapling' },
  @{ Name = 'spreadsheets'; Target = 'C:\Users\29551\.codex\plugins\cache\openai-primary-runtime\spreadsheets\26.601.10930\skills\spreadsheets' },
  @{ Name = 'markitdown-skill'; Target = 'D:\2Folder\skills\markitdown-skill' },
  @{ Name = 'multi-search-engine'; Target = 'D:\2Folder\skills\multi-search-engine' },
  @{ Name = 'external-skills-hub'; Target = 'C:\Users\29551\.codex\skills\external-skills-hub' },
  @{ Name = 'skill-creator'; Target = 'C:\Users\29551\.codex\skills\.system\skill-creator' }
)

$skillsDir = Join-Path (Get-Location) 'tools\skills'
New-Item -ItemType Directory -Force -Path $skillsDir | Out-Null

foreach ($link in $links) {
  $path = Join-Path $skillsDir $link.Name
  if (Test-Path -LiteralPath $path) {
    Write-Output "EXISTS`t$($link.Name)"
    continue
  }
  if (-not (Test-Path -LiteralPath $link.Target)) {
    Write-Output "MISSING`t$($link.Name)`t$($link.Target)"
    continue
  }
  try {
    New-Item -ItemType SymbolicLink -Path $path -Target $link.Target -ErrorAction Stop | Out-Null
    Write-Output "SYMLINK`t$($link.Name)`t$($link.Target)"
  } catch {
    New-Item -ItemType Junction -Path $path -Target $link.Target -ErrorAction Stop | Out-Null
    Write-Output "JUNCTION`t$($link.Name)`t$($link.Target)"
  }
}
