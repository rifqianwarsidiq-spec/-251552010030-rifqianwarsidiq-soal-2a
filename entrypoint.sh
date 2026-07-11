#!/bin/sh
set -e

USERNAME=$(cat /run/secrets/username)
PASSWORD=$(cat /run/secrets/password)

cat > /usr/share/nginx/html/auth-config.js <<EOF
const AUTH_USER = "${USERNAME}";
const AUTH_PASS = "${PASSWORD}";
EOF

exec nginx -g 'daemon off;'
