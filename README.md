# File Listing Tool / 文件目录生成器

Generate a file catalog (all files under a root folder) in both Excel and Word formats.
生成目录（递归扫描指定文件夹及其子文件夹），输出 Excel 与 Word。

## Structure / 目录结构

```
file_listingTool/
  app/
    generate_catalog.py
    gui_app.py
  scripts/
    mac/
      build_macos.sh
      run_targets.command
      run_targets.sh
  file_listingTool_Windows/
    build_windows.ps1
    build_windows_gui.ps1
    build_and_package_gui.ps1
    run_gui.bat
    targets/
    使用说明.txt
  build/
  dist/
  targets/
  run_gui.command
  README.md
  requirements.txt
```

## Setup / 安装

```
python3 -m pip install -r requirements.txt
```

## macOS

### GUI (recommended) / 图形界面（推荐）
Double-click / 双击：
- `run_gui.command`

### CLI / 命令行
```
python3 app/generate_catalog.py
```

### Build macOS executable / 打包 macOS 可执行文件
```
scripts/mac/build_macos.sh
```

Output / 产物：
- `dist/mac/file_listing`

## Windows

### Build GUI executable / 打包 GUI 可执行文件
```
powershell -ExecutionPolicy Bypass -File file_listingTool_Windows/build_windows_gui.ps1
```

### One-step package (GUI) / 一键打包（GUI）
Creates a shareable folder with `file_listingTool_Windows_GUI.exe` and `targets`.
生成可直接分享的文件夹（含 exe 与 targets）：
```
powershell -ExecutionPolicy Bypass -File file_listingTool_Windows/build_and_package_gui.ps1
```

### Run GUI / 运行 GUI
```
file_listingTool_Windows\run_gui.bat
```

## Outputs (default) / 默认输出

- Excel：`targets/output/spreadsheet/file_catalog.xlsx`
- Word：`targets/output/doc/file_catalog.docx`

## Build Artifacts / 构建产物

- macOS build output / macOS 产物：`dist/mac/`
- Windows build output / Windows 产物：`dist/windows/`
