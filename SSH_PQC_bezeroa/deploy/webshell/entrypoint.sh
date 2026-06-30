#!/usr/bin/env bash
set -euo pipefail

export LAB_HOST="${LAB_HOST:-ssh-pq-server}"
export LAB_PORT="${LAB_PORT:-2222}"
export SSH_USER="${SSH_USER:-analyst}"
export SSH_PASSWORD="${SSH_PASSWORD:-ChangeMe123!}"
export TTYD_PORT="${TTYD_PORT:-7681}"

exec ttyd -W -p "${TTYD_PORT}" env   LAB_HOST="$LAB_HOST"   LAB_PORT="$LAB_PORT"   SSH_USER="$SSH_USER"   SSH_PASSWORD="$SSH_PASSWORD"   /bin/bash
