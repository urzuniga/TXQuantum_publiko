#!/usr/bin/env bash
command -v docker >/dev/null 2>&1 || { echo >&2 "Docker missing"; exit 1; }
command -v docker compose >/dev/null 2>&1 || { echo >&2 "Docker compose missing"; exit 1; }
echo "Dependencies OK"
