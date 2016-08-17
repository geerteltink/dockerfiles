# PHP 7.0.9
FROM alpine:latest

RUN apk --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing add \
        curl \
        git \
        ssmtp \
        php5 \
        php5-fpm \
        php5-bcmath \
        php5-curl \
        php5-ctype \
        php5-dom \
        php5-gd \
        php5-iconv \
        php5-intl \
        php5-json \
        php5-mcrypt \
        php5-mysql \
        php5-mysqli \
        php5-opcache \
        php5-openssl \
        php5-pcntl \
        php5-pdo \
        php5-pdo_mysql \
        php5-pdo_sqlite \
        php5-phar \
        php5-redis \
        php5-sockets \
        php5-xdebug \
        php5-xml \
        php5-zlib

RUN rm -rf /var/cache/apk/*

# Ensure www-data user exists
RUN addgroup -g 1000 -S www-data \
	&& adduser -u 1000 -D -S -G www-data www-data

# Copy config
ADD php.ini /etc/php5/conf.d/50-setting.ini
ADD php-fpm.conf /etc/php5/php-fpm.conf
ADD ssmtp.conf /etc/ssmtp/ssmtp.conf

RUN php --version

# Install Composer and make it available in the PATH
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer.phar
RUN mv /usr/bin/composer.phar /usr/bin/composer

WORKDIR /app
EXPOSE 9000

CMD ["php-fpm", "-F"]
