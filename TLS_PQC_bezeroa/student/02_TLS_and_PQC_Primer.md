# TLS and PQC Primer

## 1. What TLS is
**TLS** stands for **Transport Layer Security**.

It is the protocol used to protect data moving between two systems over a network. In practice, it is the protocol that makes HTTPS secure.

TLS exists to provide:
1. **Confidentiality** — outsiders should not read the traffic.
2. **Integrity** — changes in transit should be detectable.
3. **Authentication** — the client should gain evidence about who the server is.

## 2. The two broad phases of a TLS connection
### A. Handshake phase
The client and server:
- negotiate parameters,
- establish shared secret material,
- and authenticate the server.

### B. Protected traffic phase
After the shared secret exists, application data can be encrypted and integrity-protected.

## 3. The main cryptographic roles inside TLS
TLS is not “just a certificate.”
Different pieces have different jobs.

### Symmetric encryption
Used after the handshake for efficient protection of application data.
Examples include AES-GCM and ChaCha20-Poly1305.

### Key agreement / key establishment
Used during the handshake so that both sides can derive shared secret material.
In classical modern TLS 1.3, a common choice is X25519.

### Signatures and certificates
Used so the client can validate the server’s identity and chain of trust.

## 4. A simplified classical TLS 1.3 handshake
In simplified form:
1. the client says hello,
2. the client offers supported algorithms and key share material,
3. the server chooses compatible parameters,
4. the server presents its certificate,
5. both sides derive shared secret material,
6. encrypted application traffic begins.

The important lesson:
- **key agreement** is one role,
- **certificate-based authentication** is another.

## 5. Why classical public-key cryptography is under pressure
A future large enough quantum computer is expected to threaten widely used classical public-key systems.

That matters because an attacker could record encrypted traffic today and try to decrypt it later.
This threat is often called:
- **harvest now, decrypt later**, or
- **store now, decrypt later**.

## 6. What post-quantum cryptography means
**Post-Quantum Cryptography (PQC)** refers to cryptographic algorithms designed to remain secure against both classical computers and future quantum computers.

The first major NIST PQC standards are:

### FIPS 203 — ML-KEM
A **key encapsulation mechanism** used for key establishment.
This is the most relevant standard for this challenge.

### FIPS 204 — ML-DSA
A **digital signature** standard.
Use cases include authentication, certificates, and signed software.

### FIPS 205 — SLH-DSA
Another **digital signature** standard, based on stateless hash-based signatures.

## 7. Why FIPS 203 matters especially for transport protocols
For long-term traffic confidentiality, the urgent transition problem is often the handshake’s **key establishment**.

If an attacker records traffic today and later breaks the classical public-key part of the handshake, old traffic may become readable.

That is why transport protocols such as:
- TLS,
- SSH,
- and VPN key exchange
are major early targets for PQ migration.

## 8. What “hybrid” means in TLS
A **hybrid** key exchange combines:
- a classical component,
- and a post-quantum component.

One important hybrid TLS group is:
```text
X25519MLKEM768
```

This combines:
- **X25519** — a classical elliptic-curve key exchange component,
- and **ML-KEM-style post-quantum key establishment**.

## 9. What changes when TLS migrates from classical crypto to PQ-aware crypto
The protocol still looks like TLS.
The key difference is that the **handshake’s key establishment** changes.

That means a connection may still look familiar at the application level while the handshake is already using a hybrid PQ mechanism.

This is one of the most important lessons of the challenge:
> a TLS connection can migrate its **key exchange** before it migrates **all certificate/signature infrastructure**.

## 10. Why this matters in your mission
Your mission is not about breaking HTTPS.
It is about understanding where the important artifact is located in the trust path and what cryptographic route you must use to inspect it correctly.

Remember these three ideas:
1. TLS is more than a certificate.
2. Key agreement is different from certificate authentication.
3. PQ migration is often hybrid and staged.
