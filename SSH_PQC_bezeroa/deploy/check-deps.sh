#!/usr/bin/env bash
set -euo pipefail

command -v docker >/dev/null 2>&1 || { echo "Docker missing"; exit 1; }
docker compose version >/dev/null 2>&1 || { echo "docker compose missing"; exit 1; }

echo "Dependencies OK"
