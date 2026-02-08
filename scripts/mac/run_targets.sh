#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
ROOT="$BASE_DIR/targets"
BIN="$BASE_DIR/dist/mac/file_listing"

if [ ! -x "$BIN" ]; then
  echo "Executable not found: $BIN"
  echo "Please run: $BASE_DIR/scripts/mac/build_macos.sh"
  exit 1
fi

"$BIN" --root "$ROOT"
