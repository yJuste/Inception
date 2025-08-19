#!/bin/bash

FILE=/var/log/mysql/all.log
[ -f "$FILE" ] || touch "$FILE"
chown mysql:mysql "$FILE"

mysqld_safe &
until mysqladmin ping --silent; do sleep 1; done

mysql -u root <<-EOSQL
	CREATE DATABASE IF NOT EXISTS \`${DATABASE_NAME}\`;
	CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
	GRANT ALL PRIVILEGES ON \`${DATABASE_NAME}\`.* TO '${MYSQL_USER}'@'%';
	GRANT RELOAD, PROCESS, LOCK TABLES, REPLICATION CLIENT ON *.* TO '${MYSQL_USER}'@'%';
	FLUSH PRIVILEGES;
EOSQL

mysqladmin shutdown

exec "$@"
