# NGINX Docker Container

[![build](https://github.com/xtreamwayz/dockerfiles/workflows/build/badge.svg)](https://github.com/xtreamwayz/dockerfiles/actions)

_This is part of the [xtreamwayz/dockerfiles](https://github.com/xtreamwayz/dockerfiles)._

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## containers

- **xtreamwayz/nginx:** [latest](https://github.com/xtreamwayz/dockerfiles/blob/master/nginx/latest.dockerfile)
- **xtreamwayz/php:** [7.4-cli](https://github.com/xtreamwayz/dockerfiles/blob/master/php/7.4-cli.dockerfile), [7.4-fpm](https://github.com/xtreamwayz/dockerfiles/blob/master/php/7.4-fpm.dockerfile)
- **xtreamwayz/mysql:** [latest](https://github.com/xtreamwayz/dockerfiles/blob/master/mysql/latest.dockerfile)

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
