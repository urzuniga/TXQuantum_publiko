# Reto SSH 1 — Enter the PQ Tunnel

This package contains a browser-based SSH challenge equivalent in spirit to Reto 1 (TLS), but using SSH.

## Core idea
Students act as **clients**. The SSH server is already configured to require a **hybrid post-quantum key exchange**.

The student must prove that:
- a classical SSH key exchange fails,
- a hybrid PQC SSH key exchange succeeds,
- and only then can the student retrieve the flag.

## One-command deployment
From `deploy/`:

```bash
./deploy.sh
```
