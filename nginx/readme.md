# NGINX Docker Container

![build-nginx](https://github.com/xtreamwayz/dockerfiles/workflows/build-nginx/badge.svg)

_This is part of the [xtreamwayz/dockerfiles](https://github.com/xtreamwayz/dockerfiles)._

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## containers

- **xtreamwayz/nginx:** [latest](https://github.com/xtreamwayz/dockerfiles/blob/master/nginx/latest.dockerfile)
- **xtreamwayz/php:** [7.4-cli](https://github.com/xtreamwayz/dockerfiles/blob/master/php/7.4-cli.dockerfile), [7.4-fpm](https://github.com/xtreamwayz/dockerfiles/blob/master/php/7.4-fpm.dockerfile),[8.0-cli](https://github.com/xtreamwayz/dockerfiles/blob/master/php/8.0-cli.dockerfile), [8.0-fpm](https://github.com/xtreamwayz/dockerfiles/blob/master/php/8.0-fpm.dockerfile),[8.1-cli](https://github.com/xtreamwayz/dockerfiles/blob/master/php/8.1-cli.dockerfile), [8.1-fpm](https://github.com/xtreamwayz/dockerfiles/blob/master/php/8.1-fpm.dockerfile)
- **xtreamwayz/mysql:** [latest](https://github.com/xtreamwayz/dockerfiles/blob/master/mysql/latest.dockerfile)
- **xtreamwayz/hugo:** [latest](https://github.com/xtreamwayz/dockerfiles/blob/master/hugo/latest.dockerfile)

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
