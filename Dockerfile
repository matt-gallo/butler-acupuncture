FROM caddy:2-alpine

# Set working directory
WORKDIR /app

# Copy website files
COPY index.html /app/
COPY styles.css /app/
COPY legal-styles.css /app/
COPY terms.html /app/
COPY privacy.html /app/

# Copy Caddyfile
COPY Caddyfile /etc/caddy/Caddyfile

# Railway uses dynamic PORT env variable
ENV PORT=8080

# Expose the port
EXPOSE $PORT

# Run Caddy
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
