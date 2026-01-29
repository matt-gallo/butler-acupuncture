#!/bin/sh

# Debug: Show PORT value
echo "Railway PORT: ${PORT}"

# Export PORT for Caddy to use
export PORT=${PORT:-8080}

# Copy template to final location (no sed needed, using env var)
cp /etc/caddy/Caddyfile.template /etc/caddy/Caddyfile

# Debug: Show generated Caddyfile
echo "Generated Caddyfile:"
cat /etc/caddy/Caddyfile

# Start Caddy
exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
