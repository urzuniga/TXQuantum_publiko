#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

KEEP_DATA="${1:-}"
if [ "$KEEP_DATA" = "--keep-data" ]; then
  docker compose down
  echo "Stack stopped. Persistent data kept."
else
  docker compose down -v
  echo "Stack stopped and volumes removed. New flag next time."
fi
