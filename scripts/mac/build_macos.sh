#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT_DIR"

python3 -m pip install -r requirements.txt
python3 -m pip install pyinstaller

# Build single-file executable
pyinstaller --onefile --name file_listing --distpath "$ROOT_DIR/dist/mac" --workpath "$ROOT_DIR/build/mac" "$ROOT_DIR/app/generate_catalog.py"

echo "Built: $ROOT_DIR/dist/mac/file_listing"
