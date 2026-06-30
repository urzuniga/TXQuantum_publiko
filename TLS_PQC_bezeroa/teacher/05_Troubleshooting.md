# Teacher Troubleshooting

## Problem: `deploy.sh` fails because Docker is unavailable
Check:
```bash
docker version
docker compose version
```

## Problem: host port 8080 is already in use
Edit `.env`:
```env
WEB_PORT=8081
```
Then redeploy.

## Problem: build succeeds but shell page does not open
Run:
```bash
./status.sh
```
Look at the `webshell` logs.

## Problem: validation fails
Run:
```bash
docker compose logs pqc-gateway
docker compose logs webshell
```
Then check whether the gateway healthcheck passed.

## Problem: you want a fresh new flag
Run:
```bash
./destroy.sh
./deploy.sh
```
Removing volumes causes a new flag and certificate to be generated.

## Problem: you want to keep the same flag across restarts
Use:
```bash
./destroy.sh --keep-data
./deploy.sh
```
