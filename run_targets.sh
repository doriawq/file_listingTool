#!/usr/bin/env bash
set -euo pipefail

ROOT="/Users/Doria/Desktop/AI_projects/file_listingTool/targets"
BIN="/Users/Doria/Desktop/AI_projects/file_listingTool/dist/file_listing"

if [ ! -x "$BIN" ]; then
  echo "Executable not found: $BIN"
  echo "Please run: /Users/Doria/Desktop/AI_projects/file_listingTool/build_macos.sh"
  exit 1
fi

"$BIN" --root "$ROOT"
