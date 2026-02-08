# File Listing Tool

Generate a file catalog (all files under a root folder) in both Excel and Word formats.

## Setup

```
python3 -m pip install -r requirements.txt
```

## Usage

From the project root (defaults to scanning `targets`):

```
python3 generate_catalog.py
```

Outputs (default):
- `targets/output/spreadsheet/file_catalog.xlsx`
- `targets/output/doc/file_catalog.docx`

## Options

- `--root`: Root folder to scan (default: current directory)
- `--out-xlsx`: Output Excel path
- `--out-docx`: Output Word path
- `--include-hidden`: Include hidden files/folders
- `--exclude`: Relative paths to exclude (repeatable)

Example:

```
python3 generate_catalog.py --root /path/to/project --exclude node_modules --exclude .git
```
