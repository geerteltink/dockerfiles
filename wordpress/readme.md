# WordPress Docker Container

*This is part of the [xtreamwayz/dckr-stack](https://github.com/xtreamwayz/dckr-stack).*

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
