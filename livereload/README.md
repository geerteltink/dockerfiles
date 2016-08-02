# Docker Livereload

To use, add this to your `docker-compose.yml` file:

```
livereload:
  image: xtreamwayz/livereload
  container_name: ${PROJECT_ID}-livereload
  ports:
    - "35729:35729"
  volumes_from:
    - datastore
```
