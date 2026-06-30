#!/usr/bin/env bash
cd "$(dirname "$0")"
IP=$(hostname -I | awk '{print $1}')
PORT=8080
cat > access_card.txt <<EOF
Browser shell URL: http://$IP:$PORT
User: student
Password: (configured in ttyd)
EOF
echo "Access card generated: access_card.txt"
