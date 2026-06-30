#!/bin/sh

export LAB_HOST="pqc-gateway"
export LAB_PORT="4433"
export TTYD_PORT=${TTYD_PORT:-7681}

exec ttyd -W -p ${TTYD_PORT} /bin/sh
