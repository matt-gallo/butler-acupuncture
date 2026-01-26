#!/bin/sh

# Debug: Show PORT value
echo "Railway PORT: ${PORT}"

# Replace {{PORT}} with actual PORT value in Caddyfile
sed "s/{{PORT}}/${PORT:-8080}/g" /etc/caddy/Caddyfile.template > /etc/caddy/Caddyfile

# Debug: Show generated Caddyfile
echo "Generated Caddyfile:"
cat /etc/caddy/Caddyfile

# Start Caddy
exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
