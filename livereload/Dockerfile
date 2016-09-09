FROM alpine:edge

RUN apk --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing add nodejs \
    && rm -rf /var/cache/apk/* \
    && npm install -g livereload

WORKDIR /app

ENTRYPOINT livereload /app/public -u true -d
