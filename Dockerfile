# Start from the official n8n image.
FROM n8nio/n8n:latest

# Switch to the root user to install packages
USER root

# Update package lists and install ffmpeg using apk
RUN apk update && \
    apk add --no-cache ffmpeg

# Install the required python packages
RUN pip install yt-dlp n8n-nodes-lang-python

# Switch back to the non-privileged 'node' user
USER node
