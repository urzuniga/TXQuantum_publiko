# Teacher Solution Guide

## Mission goal
Retrieve the flag from the SSH server, which only accepts hybrid PQC key exchange.

## Expected student logic
1. Try a classical KEX and observe failure.
2. Try the required hybrid KEX and observe success.
3. Log in and retrieve the flag.

## Commands
### Classical (must fail)
```bash
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o KexAlgorithms=curve25519-sha256 analyst@$LAB_HOST -p $LAB_PORT
```

### Hybrid PQC (must succeed)
```bash
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o KexAlgorithms=mlkem768x25519-sha256 analyst@$LAB_HOST -p $LAB_PORT
```

Password:
```text
ChangeMe123!
```

### Retrieve flag directly
```bash
sshpass -p "$SSH_PASSWORD" ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o KexAlgorithms=mlkem768x25519-sha256 analyst@$LAB_HOST -p $LAB_PORT 'cat ~/flag.txt'
```

## Expected success evidence
- classical KEX fails,
- hybrid KEX succeeds,
- the student can read `~/flag.txt` or see the flag in the SSH banner.
