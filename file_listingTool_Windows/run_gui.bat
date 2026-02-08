@echo off
setlocal

set ROOT=%~dp0
set PROJECT=%ROOT%..\
set EXE=%PROJECT%\dist\windows\file_listingTool_Windows_GUI.exe

if not exist "%EXE%" (
  echo GUI executable not found: %EXE%
  echo Please run: powershell -ExecutionPolicy Bypass -File "%ROOT%build_windows_gui.ps1"
  pause
  exit /b 1
)

start "" "%EXE%"
endlocal
