#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-}"
TARGET_HOST="${LAB_HOST:-ssh-pq-server}"
TARGET_PORT="${LAB_PORT:-2222}"
SSH_USER="${SSH_USER:-analyst}"
SSH_PASSWORD="${SSH_PASSWORD:-ChangeMe123!}"
COMMON_OPTS=(-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ConnectTimeout=5 -p "$TARGET_PORT")

case "$MODE" in
  classic)
    echo "Testing classical SSH KEX against ${TARGET_HOST}:${TARGET_PORT}"
    sshpass -p "$SSH_PASSWORD" ssh "${COMMON_OPTS[@]}" -o KexAlgorithms=curve25519-sha256 "$SSH_USER@$TARGET_HOST" 'echo classic-ok'
    ;;
  hybrid)
    echo "Testing hybrid PQC SSH KEX against ${TARGET_HOST}:${TARGET_PORT}"
    sshpass -p "$SSH_PASSWORD" ssh -vv "${COMMON_OPTS[@]}" -o KexAlgorithms=mlkem768x25519-sha256 "$SSH_USER@$TARGET_HOST" 'echo hybrid-ok' 2>&1 | grep -E 'kex: algorithm: mlkem768x25519-sha256|hybrid-ok'
    ;;
  flag)
    echo "Retrieving flag via hybrid PQC SSH"
    sshpass -p "$SSH_PASSWORD" ssh "${COMMON_OPTS[@]}" -o KexAlgorithms=mlkem768x25519-sha256 "$SSH_USER@$TARGET_HOST" 'cat ~/flag.txt'
    ;;
  *)
    echo "Usage: /validator/client_test.sh classic|hybrid|flag"
    exit 2
    ;;
esac
