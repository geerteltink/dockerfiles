FROM xtreamwayz:7.4-cli

RUN set -xe \
    && : "---------- Persistent dependencies ----------" \
    && apk add --no-cache --virtual .persistent-dependencies \
        git

COPY --from=composer /usr/bin/composer /usr/bin/composer
