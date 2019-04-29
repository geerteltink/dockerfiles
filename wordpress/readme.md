# WordPress Docker Container

*This is part of the [xtreamwayz/dckr-stack](https://github.com/xtreamwayz/dckr-stack).*

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## dckr-stack containers

- **xtreamwayz/nginx:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/nginx/Dockerfile)
- **xtreamwayz/php:** [5.6](https://github.com/xtreamwayz/dckr-stack/blob/master/php/5.6-fpm), [7.1-fpm](https://github.com/xtreamwayz/dckr-stack/blob/master/php/7.1-fpm), [7.2-fpm](https://github.com/xtreamwayz/dckr-stack/blob/master/php/7.2-fpm), [7.3-fpm](https://github.com/xtreamwayz/dckr-stack/blob/master/php/7.3-fpm)
- **xtreamwayz/mysql:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/mysql/Dockerfile)

## Structure

Create this dir structure:

	project_root
	├── data
	│   ├── mysql       -> Persitent MySQL data
	│   └── wordpress   -> WordPress source code
	├── themes
	├── plugins
	└── uploads

The `data/mysql/` and `data/wordpress/` dirs are optional and only required if you want to save the data locally. Or, in case for the WordPress source, if you need it for code completion in your (PhpStorm) IDE.

## Usage

Replace the regular datastore with this in your `docker-compose.yml` file:

```yaml
datastore:
  image: xtreamwayz/wordpress
  container_name: ${PROJECT_ID}-datastore
  volumes:
    - ./data/mysql:/var/lib/mysql		# Optional for persistent DB
    - ./data/wordpress:/app/public		# Optional for IDE code completion
    - ./plugins:/app/public/wp-content/plugins
    - ./themes:/app/public/wp-content/themes
    - ./uploads:/app/public/wp-content/uploads
```

## Access from terminal:

It's a volumes datastore. Once it has done it's job it exits and you can't access it anymore.
