#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
WEB_PORT=$(grep '^WEB_PORT=' .env 2>/dev/null | cut -d= -f2- || true)
WEB_PORT=${WEB_PORT:-8082}
SSH_PUBLIC_PORT=$(grep '^SSH_PUBLIC_PORT=' .env 2>/dev/null | cut -d= -f2- || true)
SSH_PUBLIC_PORT=${SSH_PUBLIC_PORT:-2222}
IP=$(hostname -I 2>/dev/null | awk '{print $1}')
IP=${IP:-TU_IP}
cat > .access-card.generated.md <<EOF
# Student Access Card — Reto SSH 1

## Browser Shell URL
http://${IP}:${WEB_PORT}

## SSH target host
${IP}

## SSH target port
${SSH_PUBLIC_PORT}

## SSH username
analyst

## SSH password
ChangeMe123!
EOF

echo "Generated .access-card.generated.md"
