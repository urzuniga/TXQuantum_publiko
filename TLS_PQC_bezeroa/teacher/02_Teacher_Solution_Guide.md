# Teacher Solution Guide

## Challenge title
**Operation HARVEST BREAKER — The Quantum Gate**

## Objective
Recover the mission token from a TLS-protected gateway available only through the browser shell.

## Expected logic
Students should infer that:
1. the challenge is about the **TLS handshake**,
2. the relevant cryptographic transition is **hybrid key exchange**,
3. the right group is **X25519MLKEM768**,
4. the page body is a decoy,
5. the flag lives in the certificate subject.

## Clean solution path
### 1. Inspect the live target
```bash
openssl s_client -connect "$LAB_HOST:$LAB_PORT" -tls1_3 -groups X25519MLKEM768 -showcerts
```

### 2. Extract just the certificate subject
```bash
openssl s_client -connect "$LAB_HOST:$LAB_PORT" -tls1_3 -groups X25519MLKEM768 -showcerts </dev/null 2>/dev/null | openssl x509 -noout -subject
```

### 3. Read the flag from the `OU` field
Typical pattern:
```text
subject=C = EU, ST = Lab, L = Relay-7, O = Harvest Breaker Research Section, OU = FLAG{...}, CN = quantum-gate.lab
```

## Things teachers should not reveal early
- the exact group string,
- that the page body is irrelevant,
- that the certificate subject holds the flag,
- or the exact final command pipeline.

## Expected misconceptions
### “The certificate is the whole challenge.”
No. It is only one role in TLS.

### “If the certificate is classical, then the connection is classical.”
No. The handshake can already use a hybrid PQ key exchange.

### “The HTTP page is where secrets always live.”
Not here.

## Hint ladder
### Hint 1
Focus on what happens **before** protected application data.

### Hint 2
Authentication and key establishment are not identical jobs.

### Hint 3
The answer is in certificate metadata.

## Internal teacher validation
```bash
docker compose exec -T webshell bash -lc 'openssl s_client -connect "$LAB_HOST:$LAB_PORT" -tls1_3 -groups X25519MLKEM768 -showcerts </dev/null 2>/dev/null | openssl x509 -noout -subject'
```
