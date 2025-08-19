#!/bin/sh

adduser --disabled-password --gecos "" "${FTP_USER}"

echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

usermod -aG www-data "${FTP_USER}"

mkdir -p "/home/${FTP_USER}/ftp"

chgrp -R www-data "/home/${FTP_USER}/ftp"
# Le '2' de chmod signifie: tous nouveaux fichiers seront dans le groupe www-data
chmod 2775 "/home/${FTP_USER}/ftp"

cat >> /etc/vsftpd.conf <<-EOF
	user_sub_token=${FTP_USER}
	local_root=/home/${FTP_USER}/ftp
	chroot_local_user=YES
	local_umask=002
	file_open_mode=0664
EOF

echo "${FTP_USER}" >> /etc/vsftpd.userlist

exec "$@"
