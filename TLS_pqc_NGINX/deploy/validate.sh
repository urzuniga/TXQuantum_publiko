#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

echo "[1/2] Testing classical handshake (must fail)..."
if docker compose run --rm validator /client_test.sh classic; then
  echo "ERROR: classical handshake succeeded, but it must fail"
  exit 1
else
  echo "OK: classical handshake failed as expected"
fi

echo "[2/2] Testing hybrid PQC handshake (must succeed)..."
docker compose run --rm validator /client_test.sh hybrid

echo "Validation OK: classic failed, hybrid succeeded"
