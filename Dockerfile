# Start from the official n8n image.
FROM n8nio/n8n:latest

# Switch to the root user to install packages
USER root

# Update package lists and install ffmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Install the required python packages
RUN pip install yt-dlp n8n-nodes-lang-python

# Switch back to the non-privileged 'node' user
USER node
