FROM caddy:2-alpine

# Set working directory
WORKDIR /app

# Copy website files
COPY index.html /app/
COPY styles.css /app/
COPY legal-styles.css /app/
COPY terms.html /app/
COPY privacy.html /app/

# Copy Caddyfile template and startup script
COPY Caddyfile.template /etc/caddy/Caddyfile.template
COPY start.sh /start.sh

# Make startup script executable
RUN chmod +x /start.sh

# Railway uses dynamic PORT env variable
ENV PORT=8080

# Expose the port
EXPOSE $PORT

# Run startup script
CMD ["/start.sh"]
