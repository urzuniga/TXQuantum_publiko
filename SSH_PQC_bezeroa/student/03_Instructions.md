# Instructions

## Goal
Access the SSH server using the correct hybrid key exchange and retrieve the flag.

## What you should prove
1. Classical KEX fails.
2. Hybrid PQC KEX succeeds.
3. The flag is retrievable only after successful hybrid negotiation.

## Useful environment variables in the web shell
- `LAB_HOST`
- `LAB_PORT`
- `SSH_USER`
- `SSH_PASSWORD`
