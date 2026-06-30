#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

docker compose ps

echo
echo "--- nginx-server logs ---"
docker compose logs --tail=20 nginx-server || true

echo
echo "--- validator logs ---"
docker compose logs --tail=20 validator || true
