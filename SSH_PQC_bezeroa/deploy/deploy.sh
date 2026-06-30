#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
./check-deps.sh

if [ ! -f .env ] && [ -f .env.example ]; then
  cp .env.example .env
  echo "[*] .env created from .env.example"
fi

docker compose up -d --build

echo
WEB_PORT=$(grep '^WEB_PORT=' .env 2>/dev/null | cut -d= -f2- || true)
WEB_PORT=${WEB_PORT:-8082}
SSH_PUBLIC_PORT=$(grep '^SSH_PUBLIC_PORT=' .env 2>/dev/null | cut -d= -f2- || true)
SSH_PUBLIC_PORT=${SSH_PUBLIC_PORT:-2222}
IP=$(hostname -I 2>/dev/null | awk '{print $1}')
IP=${IP:-TU_IP}

echo "Reto SSH 1 desplegado"
echo "Web shell : http://${IP}:${WEB_PORT}"
echo "SSH target: ${IP}:${SSH_PUBLIC_PORT}"
echo "Validate  : ./validate.sh"
