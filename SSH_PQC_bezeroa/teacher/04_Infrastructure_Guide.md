# Teacher Infrastructure Guide

## Services
### `ssh-pq-server`
- Ubuntu 26.04 based server
- OpenSSH server configured to require `mlkem768x25519-sha256`
- user: `analyst`
- password: `ChangeMe123!`
- flag generated dynamically and stored in `/home/analyst/flag.txt`
- flag also shown in SSH banner after successful transport negotiation

### `webshell`
- browser terminal for students
- contains OpenSSH client and sshpass
- preloaded environment variables for target host, port, username and password

### `validator`
- automated test client
- proves classical KEX fails and hybrid KEX succeeds
