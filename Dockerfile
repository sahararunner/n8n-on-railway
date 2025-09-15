FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Set environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV NODE_ENV=production

# Create necessary directories and set permissions
USER root
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

# Switch back to node user
USER node

# Expose the port
EXPOSE 5678

# Start n8n with full path
CMD ["npx", "n8n", "start"]
