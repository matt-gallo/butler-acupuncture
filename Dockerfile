FROM caddy:2-alpine

# Copy website files
COPY index.html /app/index.html
COPY styles.css /app/styles.css
COPY legal-styles.css /app/legal-styles.css
COPY terms.html /app/terms.html
COPY privacy.html /app/privacy.html

# Copy Caddyfile
COPY Caddyfile /etc/caddy/Caddyfile

# Expose port 8080 (Railway default)
EXPOSE 8080

# Caddy will automatically use the Caddyfile
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile"]
