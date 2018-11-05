# PHP-FPM Docker Container

[![Build Status](https://travis-ci.com/xtreamwayz/dckr-stack.svg?branch=master)](https://travis-ci.org/xtreamwayz/dckr-stack)

*This is part of the [xtreamwayz/dckr-stack](https://github.com/xtreamwayz/dckr-stack).*

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## dckr-stack containers

- **xtreamwayz/nginx:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/nginx/Dockerfile)
- **xtreamwayz/php:** [5.6](https://github.com/xtreamwayz/dckr-stack/blob/master/php/php-5.6-fpm), [7.1-fpm](https://github.com/xtreamwayz/dckr-stack/blob/master/php/php-7.1-fpm), [7.2-fpm](https://github.com/xtreamwayz/dckr-stack/blob/master/php/php-7.2-fpm), [7.3-fpm](https://github.com/xtreamwayz/dckr-stack/blob/master/php/php-7.3-fpm), [7.3-swoole](https://github.com/xtreamwayz/dckr-stack/blob/master/php/php-7.3-swoole)
- **xtreamwayz/mysql:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/mysql/Dockerfile)

## Includes

- PHP-FPM + CLI
- Extensions: bcmath, curl, ctype, dom, gd, iconv, intl, json, mbstring, mcrypt, mysql *(5.6 only)*, mysqli, opcache, openssl, pcntl, pdo, pdo_mysql, pdo_sqlite, phar, session, sockets, xdebug, xml, xmlreader, redis, zip, zlib
- [composer](https://getcomposer.org/doc/)
- [ssmtp](http://linux.die.net/man/8/ssmtp) to catch php mail() and forward to [MailHog](https://github.com/mailhog/MailHog)
- [SPX - Simple Profiling eXtension](https://github.com/NoiseByNorthwest/php-spx) can be accessed via its web UI control panel at [http://localhost/_spx/?SPX_KEY=dev](http://localhost/_spx/?SPX_KEY=dev).

## Usage

Add this to your `docker-compose.yml` file:

```yaml
  php:
    image: xtreamwayz/php:7.2
    container_name: PROJECT_ID-php
    volumes:
      - .:/app:ro,cached
      - ./data:/app/data:rw,delegated
```

## Xdebug

Xdebug is configured so it doesn't start automatically. You need to enable the debug listener in PhpStorm first and enable a session cookie in your [Chrome](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc) or [Firefox](https://chrome.google.com/extensions/detail/eadndfjplgieldjbigjakmdgkmoaaaoc) browser.

## CLI commands

```bash
# Access container
docker exec -ti <PROJECT_ID>-php /bin/sh

# Run composer
docker exec -ti <PROJECT_ID>-php composer <arguments>
```
