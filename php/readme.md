# PHP-FPM Docker Container

[![Build Status](https://travis-ci.com/xtreamwayz/dckr-stack.svg?branch=master)](https://travis-ci.com/xtreamwayz/dckr-stack)

*This is part of the [xtreamwayz/dckr-stack](https://github.com/xtreamwayz/dckr-stack).*

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## dckr-stack containers

- **xtreamwayz/nginx:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/nginx/Dockerfile)
- **xtreamwayz/php:** [7.4-cli](https://github.com/xtreamwayz/dckr-stack/blob/master/php/7.4-cli.dockerfile), [7.4-fpm](https://github.com/xtreamwayz/dckr-stack/blob/master/php/7.4-fpm.dockerfile)
- **xtreamwayz/mysql:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/mysql/Dockerfile)

## Includes

- PHP-FPM + CLI
- Extensions: bcmath, Core, ctype, curl, date, dom, exif, fileinfo, filter, ftp, gd, hash, iconv, intl, json, libxml, mbstring, mysqli, mysqlnd, openssl, pcntl, pcre, PDO, pdo_mysql, pdo_sqlite, Phar, posix, readline, redis, Reflection, session, SimpleXML, SPL, sqlite3, standard, tokenizer, xml, xmlreader, xmlwriter, Zend OPcache, zlib
- [ssmtp](http://linux.die.net/man/8/ssmtp) to catch php mail() and forward to [MailHog](https://github.com/mailhog/MailHog)

## Usage

Add this to your `docker-compose.yml` file:

```yaml
  php:
    image: xtreamwayz/php:7.3
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
