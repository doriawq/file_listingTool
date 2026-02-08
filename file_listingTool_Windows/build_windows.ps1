# Run in PowerShell on Windows
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Resolve-Path (Join-Path $root "..\\..")
Set-Location $projectRoot

python -m pip install -r requirements.txt
python -m pip install pyinstaller

# Build single-file executable
pyinstaller --onefile --name file_listingTool_Windows --distpath "$projectRoot\\dist\\windows" --workpath "$projectRoot\\build\\windows" "$projectRoot\\app\\generate_catalog.py"

Write-Host "Built: $projectRoot\\dist\\windows\\file_listingTool_Windows.exe"
