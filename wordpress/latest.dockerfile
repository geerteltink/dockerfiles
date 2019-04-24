FROM alpine:latest

RUN apk --no-cache add curl

VOLUME /app

RUN mkdir -p /app/public
COPY wp-config.php /app/wp-config.php

# Ensure www-data user exists
RUN set -x \
    && addgroup -g 1000 -S www-data \
	&& adduser -u 1000 -D -S -G www-data www-data \
    && chown -R www-data:www-data /app

COPY docker-entrypoint.sh /datastore-entrypoint.sh
RUN chmod +x /datastore-entrypoint.sh
ENTRYPOINT ["/datastore-entrypoint.sh"]
