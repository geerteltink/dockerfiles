# Livereload Docker Container

*This is part of the [xtreamwayz/dckr-stack](https://github.com/xtreamwayz/dckr-stack).*

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## dckr-stack Containers

- xtreamwayz/nginx: `[latest](https://github.com/xtreamwayz/dckr-stack/blob/master/nginx/Dockerfile)`
- xtreamwayz/php: `[5.6](https://github.com/xtreamwayz/dckr-stack/blob/master/php/5.6/Dockerfile)` ([Alpine Linux](https://pkgs.alpinelinux.org/packages?name=php5*&branch=edge&arch=x86_64)), `[7.0](https://github.com/xtreamwayz/dckr-stack/blob/master/php/7.0/Dockerfile)` ([Alpine Linux](https://pkgs.alpinelinux.org/packages?name=php7*&branch=edge&arch=x86_64)), `[latest](https://github.com/xtreamwayz/dckr-stack/blob/master/php/7.1/Dockerfile)` ([Source](https://github.com/php/php-src))
- xtreamwayz/mysql: `[latest](https://github.com/xtreamwayz/dckr-stack/blob/master/mysql/Dockerfile)`
- xtreamwayz/livereload: `[latest](https://github.com/xtreamwayz/dckr-stack/blob/master/livereload/Dockerfile)`

## Usage

Add this to your `docker-compose.yml` file:

```yaml
livereload:
  image: xtreamwayz/livereload
  container_name: ${PROJECT_ID}-livereload
  ports:
    - "35729:35729"
  volumes_from:
    - datastore
```

## CLI commands

```bash
# Access livereload
docker exec -ti <PROJECT_ID>-php /bin/sh
```
