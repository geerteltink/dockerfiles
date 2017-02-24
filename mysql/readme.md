# MySQL Docker Container

*This is part of the [xtreamwayz/dckr-stack](https://github.com/xtreamwayz/dckr-stack).*

Extends mysql/mysql-server. Some [basic settings](https://github.com/xtreamwayz/dckr-mysql/blob/master/my.cnf) are applied.

## Usage

Add this to your `docker-compose.yml` file:

```yaml
db:
  image: xtreamwayz/mysql
  container_name: ${PROJECT_ID}-db
  ports:
    - "3306:3306"
  env_file: .env
  #volumes:
  #  - ./resources/mysql-dump:/docker-entrypoint-initdb.d  # Import .sql files
  #  - ./data/mysql-data:/var/lib/mysql                    # persistent database
  volumes_from:
    - datastore
```

## CLI commands

```bash
# Access container
docker exec -ti <PROJECT_ID>-db /bin/sh
```

## Creating a new database and user

```bash
# Change UNIQUE_NAME-db with the name that is used in `docker-compose.yml` -> `services:db:container_name`
docker exec UNIQUE_NAME-db mysql -h"db" -P"3306" -uroot -p"docker" -e "CREATE DATABASE IF NOT EXISTS develop;"
docker exec UNIQUE_NAME-db mysql -h"db" -P"3306" -uroot -p"docker" -e "CREATE USER IF NOT EXISTS 'develop'@'%' IDENTIFIED BY 'develop';"
docker exec UNIQUE_NAME-db mysql -h"db" -P"3306" -uroot -p"docker" -e "GRANT ALL PRIVILEGES ON develop.* TO 'develop'@'%';"
```
