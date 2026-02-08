#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
python3 "$BASE_DIR/app/gui_app.py"
