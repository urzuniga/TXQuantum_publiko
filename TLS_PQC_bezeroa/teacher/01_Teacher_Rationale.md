# Teacher Rationale

## Why this is the right first challenge
This challenge teaches the most important current practical idea in PQC migration:
**hybrid key exchange in TLS 1.3**.

That makes it ideal as a first step before moving on to signatures and certificates in later labs.

## Standards alignment
The challenge explicitly connects to the first NIST PQC standards:
- **FIPS 203 — ML-KEM**
- **FIPS 204 — ML-DSA**
- **FIPS 205 — SLH-DSA**

The live challenge itself focuses on **FIPS 203**, because the main protocol role under study is **key establishment**.

## Why TLS is pedagogically powerful
TLS is familiar enough that students are not starting from zero, but deep enough to teach important distinctions.

This challenge supports discussion of:
- what a protocol handshake is,
- what key agreement does,
- why certificates exist,
- why key exchange and signatures are different,
- and how migration can happen in stages.

## Why the certificate is classical on purpose
That is not a mistake. It is part of the lesson.

Students learn that a TLS connection can already use a post-quantum-aware **key exchange** while still relying on a classical certificate signature.

That distinction becomes critical later when you introduce FIPS 204 and FIPS 205.

## Why the browser-shell model is appropriate
Students should spend their attention on protocol understanding and not on setup friction.

The browser shell gives them:
- a real terminal,
- real tools,
- a live service,
- and no Docker burden.

## AI-resistance rationale
The student handouts do not include the final answer.
The flag is generated at runtime.
The target details are operationalized in the live shell.
The answer is in certificate metadata rather than in obvious page content.

This does not block AI reasoning assistance, but it does prevent “paste docs, get flag” failure mode.
