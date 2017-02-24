# NGINX Docker Container

*This is part of the [xtreamwayz/dckr-stack](https://github.com/xtreamwayz/dckr-stack).*

What else would you need to serve your app!

The documents are served from `.:/app/public` and can be accessed at http://127.0.0.1/.

## Usage

Add this to your `docker-compose.yml` file:

```yaml
web:
  image: xtreamwayz/nginx
  container_name: ${PROJECT_ID}-web
  ports:
    - "80:80"
  volumes_from:
    - datastore
  links:
    - php
```

## CLI commands

```bash
# Access container
docker exec -ti <PROJECT_ID>-web /bin/sh
```
