# NGINX Docker Container

*This is part of the [xtreamwayz/dckr-stack](https://github.com/xtreamwayz/dckr-stack).*

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## dckr-stack containers

- **xtreamwayz/nginx:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/nginx/Dockerfile)
- **xtreamwayz/php:** [5.6](https://github.com/xtreamwayz/dckr-stack/blob/master/php/php-5.6-fpm), [7.1-fpm](https://github.com/xtreamwayz/dckr-stack/blob/master/php/php-7.1-fpm), [7.2-fpm](https://github.com/xtreamwayz/dckr-stack/blob/master/php/php-7.2-fpm), [7.3-fpm](https://github.com/xtreamwayz/dckr-stack/blob/master/php/php-7.3-fpm), [7.3-swoole](https://github.com/xtreamwayz/dckr-stack/blob/master/php/php-7.3-swoole)
- **xtreamwayz/mysql:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/mysql/Dockerfile)

## Usage

The documents are served from `.:/app/public` and can be accessed at http://127.0.0.1/.

Add this to your `docker-compose.yml` file:

```yaml
  web:
    image: xtreamwayz/nginx
    container_name: PROJECT_ID-web
    ports:
      - "80:80"
    volumes:
      - ./public:/app/public:ro,cached
```

## CLI commands

```bash
# Access container
docker exec -ti <PROJECT_ID>-web /bin/sh
```
