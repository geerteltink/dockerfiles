FROM alpine:latest

RUN apk add --update \
        nodejs \
    && npm install -g livereload \
    && rm -rf \
		/var/cache/apk/* \
   		/usr/share/doc \
        /usr/share/man

# Display versions
RUN node --version
# Force exit code 0: livereload always returns a non 0 exit
RUN livereload --version; exit 0

WORKDIR /app
ENTRYPOINT livereload /app/public -u true -d
