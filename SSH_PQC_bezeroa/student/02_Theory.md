# SSH and PQC Theory Primer

SSH begins with transport negotiation and key exchange before authentication and shell access.

In this challenge, the server enforces a hybrid SSH KEX policy. The important part is not the login itself, but the **key exchange algorithm** used by the SSH transport.

The required hybrid KEX is:
```text
mlkem768x25519-sha256
```

This combines:
- X25519 (classical ECDH component)
- ML-KEM-768 (post-quantum KEM component)

The challenge is solved when you prove classical failure and hybrid success.
