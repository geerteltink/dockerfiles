# WordPress

*nginx, php, mysql, livereload*

A docker compose file for a WordPress stack is included. Copy docker-wordpress.yml to docker-compose.yml.

Create this dir structure:

	project_root
	├── data
	│   ├── mysql       -> Persitent MySQL data
	│   └── wordpress   -> WordPress source code
	├── themes
	├── plugins
	└── uploads

The `data/mysql/` and `data/wordpress/` dirs are optional and only required if you want to save the data locally. Or, in case for the WordPress source, if you need it for code completion in your (PhpStorm) IDE.
