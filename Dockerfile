FROM nginx:latest

# Build arguments
ARG RELEASE=master

# Setup base
RUN apt update -y \
        && apt install -y curl unzip \
        && curl -L https://github.com/resoai/TileBoard/archive/${RELEASE}.zip > /tmp/tileboard.zip \
        && unzip /tmp/tileboard.zip -d /usr/share/nginx/html \
        && rm /tmp/tileboard.zip \
        && apt remove -y curl unzip \
        && rm -rf /var/lib/apt/lists/*
