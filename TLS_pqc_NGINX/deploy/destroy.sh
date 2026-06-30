#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
docker compose down -v

echo "Reto 2 detenido y eliminado"
