# Reto 2 Package Overview

This package contains the second challenge in the PQC sequence.

## Core idea
Students are no longer just clients. They must migrate an NGINX TLS endpoint from a classical TLS 1.3 configuration to a hybrid PQC configuration.

## Expected end state
- Classical X25519 handshake: FAIL
- Hybrid X25519MLKEM768 handshake: SUCCESS
