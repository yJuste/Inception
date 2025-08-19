#!/bin/bash

[ -f /etc/backup.env ] && source /etc/backup.env

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
TARGET="/backups/$DATE"

mkdir -p "$TARGET"
mkdir -p /var/lib/mysql

until mariadb -h"${MYSQL_HOSTNAME}" -P3306 -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" -e "SELECT 1" &>/dev/null; do
	echo "Waiting MariaDB..."
	sleep 1
done

mariabackup --backup \
	--target-dir="$TARGET" \
	--host="${MYSQL_HOSTNAME}" \
	--port=3306 \
	--user="${MYSQL_USER}" \
	--password="${MYSQL_PASSWORD}"

mariabackup --prepare --quiet --target-dir="$TARGET"

tar czf "/backups/${DATE}.tar.gz" -C /backups "$DATE"
rm -rf "$TARGET"

echo -e "\033[32mBackup [OK] -> $TARGET\033[0m"
