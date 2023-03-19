# NGINX Docker Container

![build-nginx](https://github.com/geerteltink/dockerfiles/workflows/build-nginx/badge.svg)

_This is part of the [geerteltink/dockerfiles](https://github.com/geerteltink/dockerfiles)._

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## Usage

The documents are served from `.:/app/public` and can be accessed at http://127.0.0.1/.

Add this to your `docker-compose.yml` file:

```yaml
web:
  image: ghcr.io/geerteltink/nginx
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
