FROM node:18-alpine

# Install n8n globally
RUN npm install -g n8n@latest

# Set environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Create app directory and user
RUN addgroup -g 1000 n8n && \
    adduser -u 1000 -G n8n -s /bin/sh -D n8n && \
    mkdir -p /home/n8n/.n8n && \
    chown -R n8n:n8n /home/n8n

# Switch to n8n user
USER n8n
WORKDIR /home/n8n

# Expose port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]
