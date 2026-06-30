# Solution Guide

## Student task
Change the NGINX TLS configuration from classical TLS to hybrid PQC.

## Starting point
`ssl_ecdh_curve X25519;`

## Final state
`ssl_ecdh_curve X25519MLKEM768;`

## Rebuild
```bash
docker compose up -d --build nginx-server
```

## Final validation
```bash
./validate.sh
```
