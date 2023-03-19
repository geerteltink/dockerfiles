FROM golang:1-alpine

WORKDIR /src
VOLUME /src

RUN set -xe \
    && : "---------- Fix possible vulnerabilities ----------" \
    && apk --update --no-cache upgrade \
    && : "---------- Persistent dependencies ----------" \
    && apk add --no-cache --virtual .persistent-dependencies \
        git \
        nodejs \
        npm \
        hugo \
    && : "---------- Clean up ----------" \
    && rm -rf \
        /tmp/* \
        /usr/includes/* \
        /usr/share/man/* \
        /usr/src/* \
        /var/cache/apk/* \
        /var/tmp/* \
    && : "---------- Set git safe directory ----------" \
    && git config --global --add safe.directory /src \
    && : "---------- Display some debug output ----------" \
    && node --version \
    && go version \
    && hugo version

EXPOSE 1313

CMD hugo server \
    --bind 0.0.0.0 \
    --navigateToChanged \
    --templateMetrics \
    --buildDrafts
