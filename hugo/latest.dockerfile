FROM golang:1-alpine

LABEL version="hugo-extended"
LABEL repository="https://github.com/xtreamwayz/dockerfiles"
LABEL homepage="https://github.com/xtreamwayz/dockerfiles"
LABEL maintainer="Geert Eltink"

RUN set -xe \
    && : "---------- Fix possible vulnerabilities ----------" \
    && apk --update --no-cache upgrade
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
    && : "---------- Display some debug output ----------" \
    && node --version \
    && go version \
    && hugo version

WORKDIR /src
VOLUME /src

EXPOSE 1313

CMD hugo server \
    --bind 0.0.0.0 \
    --navigateToChanged \
    --templateMetrics \
    --buildDrafts
