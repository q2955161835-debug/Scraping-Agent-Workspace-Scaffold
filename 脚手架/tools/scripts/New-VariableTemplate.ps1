param(
  [Parameter(Mandatory = $true)]
  [string]$ProjectPath,

  [string]$OutputName = '变量确认表.csv'
)

if (-not (Test-Path -LiteralPath $ProjectPath)) {
  throw "项目路径不存在：$ProjectPath"
}

$docPath = Join-Path $ProjectPath 'doc'
New-Item -ItemType Directory -Path $docPath -Force | Out-Null
$outputPath = Join-Path $docPath $OutputName

if (Test-Path -LiteralPath $outputPath) {
  throw "变量确认表已存在：$outputPath"
}

$rows = @(
  [PSCustomObject]@{
    '变量名' = ''
    '字段含义' = ''
    '单位' = ''
    '数据类型' = ''
    '来源优先级' = '官方>官方新闻>第三方新闻>论文>逆向计算>论坛>其他渠道'
    '是否必填' = ''
    '清洗规则' = ''
    '可接受缺失条件' = ''
    '备注' = ''
  }
)

$rows | Export-Csv -Path $outputPath -NoTypeInformation -Encoding UTF8
Write-Output $outputPath
