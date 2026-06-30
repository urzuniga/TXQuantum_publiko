#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
WEB_PORT=$(grep '^WEB_PORT=' .env 2>/dev/null | cut -d= -f2- || true)
WEB_PORT=${WEB_PORT:-4443}
IP=$(hostname -I 2>/dev/null | awk '{print $1}')
IP=${IP:-TU_IP}
cat > access_card.txt <<EOF
Reto 2 NGINX endpoint: https://${IP}:${WEB_PORT}
EOF

echo "Generated access_card.txt"
