# Run in PowerShell on Windows
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Resolve-Path (Join-Path $root "..\..")
Set-Location $projectRoot

# Build GUI executable
powershell -ExecutionPolicy Bypass -File "$root\build_windows_gui.ps1"

# Copy EXE to package folder
$exe = Join-Path $projectRoot "dist\windows\file_listingTool_Windows_GUI.exe"
if (!(Test-Path $exe)) {
  throw "EXE not found: $exe"
}

Copy-Item -Force $exe (Join-Path $root "file_listingTool_Windows_GUI.exe")

# Ensure targets folder exists
$targets = Join-Path $root "targets"
New-Item -ItemType Directory -Force -Path $targets | Out-Null

Write-Host "Packaged: $root\file_listingTool_Windows_GUI.exe"
Write-Host "Targets folder: $root\targets"
