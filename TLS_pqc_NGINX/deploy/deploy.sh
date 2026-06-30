#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
./check-deps.sh

if [ ! -f .env ] && [ -f .env.example ]; then
  cp .env.example .env
fi

docker compose up -d --build

echo
WEB_PORT=$(grep '^WEB_PORT=' .env 2>/dev/null | cut -d= -f2- || true)
WEB_PORT=${WEB_PORT:-4443}
echo "Reto 2 desplegado"
echo "NGINX TLS endpoint: https://TU_IP:${WEB_PORT}"
