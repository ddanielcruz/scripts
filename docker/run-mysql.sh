#!/bin/sh
source ./.mysql.env;
docker container run -d --name mysql --restart unless-stopped -p 3306:3306 -v mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD="$DB_PASS" mysql:8.0;
