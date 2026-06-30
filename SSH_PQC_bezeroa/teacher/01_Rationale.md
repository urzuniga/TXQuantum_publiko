# Teacher Rationale

## Why this challenge is the right next step after TLS
Students have already seen the key idea in TLS:
- classical key exchange fails,
- hybrid PQC key exchange succeeds.

This SSH version reinforces the same transition logic in a second real protocol.

## Why SSH fits well pedagogically
Students often know SSH as “remote shell access”, but they rarely think about its transport layer and key exchange. This challenge makes that visible.

## What exactly students should understand
- SSH is not “just login”.
- SSH begins with transport negotiation and key exchange.
- The server can enforce a required KEX policy.
- In this challenge, that required KEX is hybrid PQC.

## Why the student is still the client here
This challenge is intentionally parallel to Reto 1. It teaches **recognition and validation** of a migrated service. Later challenges can move to server-side migration.
