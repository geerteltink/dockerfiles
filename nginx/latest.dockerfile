FROM nginx:stable-alpine

RUN set -xe \
    && : "---------- Fix possible vulnerabilities ----------" \
    && apk --update --no-cache upgrade \
    && mkdir -p /opt/media/images \
    && mkdir -p /tmp/nginx-image-cache/ \
    && : "---------- Clean up ----------" \
    && rm -rf \
        /tmp/* \
        /usr/includes/* \
        /usr/share/man/* \
        /var/cache/apk/* \
        /var/tmp/*

# Config
COPY config/ /etc/nginx/
COPY assets/ /opt/media/images/

RUN nginx -V
