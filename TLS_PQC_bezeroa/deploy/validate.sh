#!/usr/bin/env bash
cd "$(dirname "$0")"
echo "Validation: Checking if gateway responds..."
docker compose exec -T pqc-gateway sh -c "echo ok" || echo "Gateway not available"
