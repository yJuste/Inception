#!/bin/bash

mysqld_safe &
until mysqladmin ping --silent; do sleep 1; done

mysql -u root <<-EOSQL
        CREATE DATABASE IF NOT EXISTS \`${DATABASE_NAME}\`;
        CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
        GRANT ALL PRIVILEGES ON \`${DATABASE_NAME}\`.* TO '${MYSQL_USER}'@'%';
        FLUSH PRIVILEGES;
EOSQL
        mysqladmin shutdown

exec "$@"
