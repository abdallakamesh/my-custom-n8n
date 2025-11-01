# Start from the official n8n image.
FROM n8nio/n8n:latest

# Switch to the root user to install packages
USER root

# Update package lists and install ffmpeg, python, and pip
RUN apk update && \
    apk add --no-cache ffmpeg python3 py3-pip

# Install the required python packages, breaking the environment lock
RUN pip3 install --break-system-packages yt-dlp n8n-nodes-lang-python

# Switch back to the non-privileged 'node' user
USER node
