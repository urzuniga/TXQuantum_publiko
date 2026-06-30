#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

echo "[1/3] Testing classical SSH KEX (must fail)..."
if docker compose run --rm validator /validator/client_test.sh classic; then
  echo "ERROR: classical KEX succeeded, but it must fail"
  exit 1
else
  echo "OK: classical KEX failed as expected"
fi

echo "[2/3] Testing hybrid PQC SSH KEX (must succeed)..."
docker compose run --rm validator /validator/client_test.sh hybrid

echo "[3/3] Retrieving flag via hybrid SSH..."
docker compose run --rm validator /validator/client_test.sh flag

echo "Validation OK"
