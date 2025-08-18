#!/bin/sh
set -e

adduser --disabled-password --gecos "" "$FTP_USER"

echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

mkdir -p "/home/$FTP_USER/ftp"
chown -R "$FTP_USER:$FTP_USER" "/home/$FTP_USER"

cat >> /etc/vsftpd.conf <<-EOF
user_sub_token=$FTP_USER
local_root=/home/$FTP_USER/ftp
chroot_local_user=YES
EOF

echo "$FTP_USER" >> /etc/vsftpd.userlist

exec "$@"
