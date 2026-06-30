#!/usr/bin/env bash
set -euo pipefail

SSH_USER="${SSH_USER:-analyst}"
SSH_PASSWORD="${SSH_PASSWORD:-ChangeMe123!}"
FLAG_FILE="/data/flag.txt"
BANNER_FILE="/etc/issue.net"
HOME_DIR="/home/${SSH_USER}"

if ! id -u "$SSH_USER" >/dev/null 2>&1; then
  useradd -m -s /bin/bash "$SSH_USER"
fi

echo "${SSH_USER}:${SSH_PASSWORD}" | chpasswd

mkdir -p /var/run/sshd /data
ssh-keygen -A

if [ ! -f "$FLAG_FILE" ]; then
  RAND="$(openssl rand -hex 13)"
  echo "FLAG{ssh_pq_tunnel_${RAND}}" > "$FLAG_FILE"
fi

if [ ! -s "$FLAG_FILE" ]; then
  echo "ERROR: flag file was not created: $FLAG_FILE" >&2
  exit 1
fi

FLAG="$(cat "$FLAG_FILE")"

cat > "$BANNER_FILE" <<EOF
Reto SSH 1 — Enter the PQ Tunnel
Only a client that negotiates the required hybrid PQC key exchange can enter.
Mission token: ${FLAG}
EOF

cp "$FLAG_FILE" "$HOME_DIR/flag.txt"
chown -R "$SSH_USER:$SSH_USER" "$HOME_DIR"
chmod 600 "$HOME_DIR/flag.txt"

cat > /etc/ssh/sshd_config <<EOF
Port 2222
Protocol 2
HostKey /etc/ssh/ssh_host_ed25519_key
UsePAM no
PasswordAuthentication yes
KbdInteractiveAuthentication no
PermitRootLogin no
PubkeyAuthentication yes
Banner ${BANNER_FILE}
PrintMotd no
ChallengeResponseAuthentication no
Subsystem sftp /usr/lib/openssh/sftp-server
KexAlgorithms mlkem768x25519-sha256,sntrup761x25519-sha512@openssh.com,sntrup761x25519-sha512
EOF

/usr/sbin/sshd -t -f /etc/ssh/sshd_config

exec /usr/sbin/sshd -D -e