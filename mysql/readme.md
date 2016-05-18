# MySQL

Extends mysql/mysql-server. Some basic settings are applied and data is stored in the datastore: `/app/data/mysql`.

## Creating a database and user

```bash
# Change UNIQUE_NAME-db with the name that is used in `docker-compose.yml` -> `services:db:container_name`
docker exec UNIQUE_NAME-db mysql -h"db" -P"3306" -uroot -p"docker" -e "CREATE DATABASE IF NOT EXISTS develop;"
docker exec UNIQUE_NAME-db mysql -h"db" -P"3306" -uroot -p"docker" -e "CREATE USER IF NOT EXISTS 'develop'@'%' IDENTIFIED BY 'develop';"
docker exec UNIQUE_NAME-db mysql -h"db" -P"3306" -uroot -p"docker" -e "GRANT ALL PRIVILEGES ON develop.* TO 'develop'@'%';"
```
