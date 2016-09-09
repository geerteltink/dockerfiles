FROM alpine:edge

RUN apk --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing add \
        alpine-sdk \
        python \
        nodejs \
    && npm install -g livereload \
    && apk del alpine-sdk python \
    && rm -rf \
		/var/cache/apk/* \
   		/usr/share/doc \
        /usr/share/man

WORKDIR /app

ENTRYPOINT livereload /app/public -u true -d
