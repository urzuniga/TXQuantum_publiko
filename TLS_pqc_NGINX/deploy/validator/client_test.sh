#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-}"
TARGET="nginx-server:443"

case "$MODE" in
  classic)
    echo "Testing classical TLS handshake against ${TARGET}"
    # This command should FAIL after migration
    openssl s_client -connect "$TARGET" -tls1_3 -groups X25519 -brief </dev/null
    ;;
  hybrid)
    echo "Testing hybrid PQC TLS handshake against ${TARGET}"
    openssl s_client -connect "$TARGET" -tls1_3 -groups X25519MLKEM768 -brief </dev/null | grep -E 'X25519MLKEM768|Protocol|Cipher'
    ;;
  *)
    echo "Usage: /client_test.sh classic|hybrid"
    exit 2
    ;;
esac
