FROM nginx:latest

# Build arguments
ARG RELEASE=master

# Setup base
RUN apk add --no-cache curl unzip \
        && curl -L https://github.com/resoai/TileBoard/archive/${RELEASE}.zip > /tmp/tileboard.zip \
        && unzip /tmp/tileboard.zip -d /usr/share/nginx/html \
        && rm /tmp/tileboard.zip \
        && apk del --no-cache --purge curl unzip

