#!/bin/sh

adduser --disabled-password --gecos "" "${FTP_USER}"

echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

getent group www-data >/dev/null 2>&1 || groupadd -r www-data
usermod -aG www-data "${FTP_USER}"

mkdir -p "/home/${FTP_USER}/ftp"
chgrp -R www-data "/home/${FTP_USER}/ftp"
chmod 2775 "/home/${FTP_USER}/ftp"

find "/home/${FTP_USER}/ftp" -type d -exec chmod 775 {} \;
find "/home/${FTP_USER}/ftp" -type f -exec chmod 664 {} \;

cat >> /etc/vsftpd.conf <<-EOF
	user_sub_token=${FTP_USER}
	local_root=/home/${FTP_USER}/ftp
	chroot_local_user=YES
	local_umask=002
	file_open_mode=0664
EOF

echo "${FTP_USER}" >> /etc/vsftpd.userlist

exec "$@"
