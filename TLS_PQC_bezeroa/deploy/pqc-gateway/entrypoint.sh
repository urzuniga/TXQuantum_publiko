#!/bin/sh
set -eu

DATA_DIR="/data"
CERT_DIR="$DATA_DIR/certs"
FLAG_FILE="$DATA_DIR/flag.txt"

mkdir -p "$CERT_DIR"

if [ ! -f "$FLAG_FILE" ]; then
  RAND=$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c 26)
  echo "FLAG{harvest_breaker_$RAND}" > "$FLAG_FILE"
fi

FLAG=$(cat "$FLAG_FILE")

if [ ! -f "$CERT_DIR/server.key" ] || [ ! -f "$CERT_DIR/server.crt" ]; then
  openssl req     -x509     -newkey rsa:2048     -sha256     -nodes     -days 3650     -keyout "$CERT_DIR/server.key"     -out "$CERT_DIR/server.crt"     -subj "/C=EU/ST=Lab/L=Relay-7/O=Harvest Breaker Research Section/OU=$FLAG/CN=quantum-gate.lab"
fi

exec openssl s_server   -accept 4433   -cert "$CERT_DIR/server.crt"   -key "$CERT_DIR/server.key"   -tls1_3   -groups X25519MLKEM768   -www
