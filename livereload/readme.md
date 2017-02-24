# Livereload Docker Container

*This is part of the [xtreamwayz/dckr-stack](https://github.com/xtreamwayz/dckr-stack).*

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
