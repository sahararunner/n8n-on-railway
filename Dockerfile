FROM node:20-alpine

# Install n8n globally
RUN npm install -g n8n@latest

# Set environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Expose port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]
