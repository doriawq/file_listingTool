#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT_DIR"

python3 -m pip install -r requirements.txt
python3 -m pip install pyinstaller

# Build single-file executable
pyinstaller --onefile --name file_listing generate_catalog.py

echo "Built: $ROOT_DIR/dist/file_listing"
