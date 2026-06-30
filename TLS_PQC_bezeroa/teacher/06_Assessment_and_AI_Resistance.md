# Assessment and AI-Resistance Notes

## Package strategy
This package is designed so that AI can assist with reasoning but cannot directly return the final answer from the student handouts alone.

## Why it works better than a static challenge
- the flag is generated at deployment time,
- the student documents do not contain the exact solution pipeline,
- the live environment matters,
- the flag is not placed in an obvious content body,
- and the student must understand TLS roles to progress efficiently.

## Suggested grading rubric
### Basic pass
Student can explain:
- what TLS is,
- what a handshake is,
- and why key agreement differs from certificates.

### Solid pass
Student can:
- connect to the live target correctly,
- extract the certificate subject,
- and recover the flag.

### Strong pass
Student can additionally explain:
- what FIPS 203 does,
- why FIPS 204 and FIPS 205 are not the same role,
- and why hybrid migration is useful.
