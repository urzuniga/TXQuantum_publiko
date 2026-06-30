# Instructions

## Goal
Modify the server so that only hybrid PQC handshake succeeds.

## Hint
You are looking for the TLS group configuration in the NGINX config.

## Rebuild after changes
```bash
cd reto2/deploy
docker compose up -d --build nginx-server
```
