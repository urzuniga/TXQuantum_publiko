#!/bin/sh
set -eu
exec /opt/nginx/sbin/nginx -c /opt/nginx/nginx-conf/nginx.conf -g 'daemon off;'
