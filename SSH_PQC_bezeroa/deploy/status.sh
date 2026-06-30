#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

docker compose ps

echo
echo "--- ssh-pq-server logs ---"
docker compose logs --tail=20 ssh-pq-server || true

echo
echo "--- webshell logs ---"
docker compose logs --tail=20 webshell || true
