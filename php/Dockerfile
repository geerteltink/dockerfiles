FROM alpine:edge

RUN apk --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing add \
        curl \
        git \
        ssmtp \
        php7 \
        php7-fpm \
        php7-bcmath \
        php7-curl \
        php7-ctype \
        php7-dom \
        php7-gd \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-opcache \
        php7-openssl \
        php7-pcntl \
        php7-pdo \
        php7-pdo_mysql \
        php7-phar \
        php7-session \
        php7-sockets \
        php7-xml \
        php7-redis \
        php7-xdebug

RUN rm -rf /var/cache/apk/*

ADD php.ini /etc/php7/conf.d/50-setting.ini
ADD php-fpm.conf /etc/php7/php-fpm.conf
ADD ssmtp.conf /etc/ssmtp/ssmtp.conf

# Create symlink for php
RUN ln -s /usr/bin/php7 /usr/bin/php

# Install Composer and make it available in the PATH
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer.phar
RUN mv /usr/bin/composer.phar /usr/bin/composer

WORKDIR /app
EXPOSE 9000

CMD ["php-fpm7", "-F"]
