# Run in PowerShell on Windows
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Resolve-Path (Join-Path $root "..\\..")
Set-Location $projectRoot

python -m pip install -r requirements.txt
python -m pip install pyinstaller

# Build windowed GUI executable
pyinstaller --onefile --windowed --name file_listingTool_Windows_GUI --distpath "$projectRoot\\dist\\windows" --workpath "$projectRoot\\build\\windows_gui" "$projectRoot\\app\\gui_app.py"

Write-Host "Built: $projectRoot\\dist\\windows\\file_listingTool_Windows_GUI.exe"
