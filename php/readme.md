# PHP-FPM Docker Container

![build-php-7-4](https://github.com/geerteltink/dockerfiles/workflows/build-php-7-4/badge.svg)
![build-php-8-0](https://github.com/geerteltink/dockerfiles/workflows/build-php-8-0/badge.svg)
![build-php-8-1](https://github.com/geerteltink/dockerfiles/workflows/build-php-8-1/badge.svg)

_This is part of the [geerteltink/dockerfiles](https://github.com/geerteltink/dockerfiles)._

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## Includes

- PHP-FPM + CLI
- Extensions: bcmath, Core, ctype, curl, date, dom, exif, fileinfo, filter, ftp, gd, hash, iconv, intl, json, libxml, mbstring, mysqli, mysqlnd, openssl, pcntl, pcre, PDO, pdo_mysql, pdo_sqlite, Phar, posix, readline, redis, Reflection, session, SimpleXML, SPL, sqlite3, standard, tokenizer, xml, xmlreader, xmlwriter, Zend OPcache, zlib
- [ssmtp](http://linux.die.net/man/8/ssmtp) to catch php mail() and forward to [MailHog](https://github.com/mailhog/MailHog)

## Usage

Add this to your `docker-compose.yml` file:

```yaml
php:
  image: ghcr.io/geerteltink/php:7.4
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
