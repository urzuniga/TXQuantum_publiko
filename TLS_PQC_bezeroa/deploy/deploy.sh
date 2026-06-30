#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
./check-deps.sh
docker compose up -d --build
echo "Deployment complete"
