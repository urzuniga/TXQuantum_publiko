# Teacher Infrastructure Guide

## Architecture summary
The deployment uses two containers on one private Docker network.

### `pqc-gateway`
Purpose:
- actual challenge target,
- dynamic flag generation,
- self-signed certificate generation,
- TLS 1.3 service restricted to `X25519MLKEM768`.

Internal endpoint:
- `pqc-gateway:4433`

### `webshell`
Purpose:
- browser-based terminal for students,
- controlled environment with PQ-capable OpenSSL tooling,
- no Docker exposure to students.

External endpoint:
- `http://HOST:8080` by default.

## Persistent data
Named volume: `gate_data`

Stored artifacts:
- generated flag,
- server private key,
- server certificate.

Benefit:
- restarts do not silently rotate the answer unless you remove volumes.

## Why the service is intentionally minimal
The challenge uses `openssl s_server` rather than a larger full-stack web server.
This minimizes moving parts and keeps the lab focused on TLS handshake behavior.

## Security scope
This is a teaching lab package, not a production architecture.
Students should be isolated from the host and from non-lab targets.
