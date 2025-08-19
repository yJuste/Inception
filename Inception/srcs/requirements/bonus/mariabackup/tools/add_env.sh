#!/bin/bash

{
	echo "MYSQL_HOSTNAME=${MYSQL_HOSTNAME}"
	echo "MYSQL_USER=${MYSQL_USER}"
	echo "MYSQL_PASSWORD=${MYSQL_PASSWORD}"
} > /etc/backup.env

chmod 600 /etc/backup.env

exec "$@"
