#!/bin/bash

set -e

chmod -R 777 /var/www/html

FTP_PASSWORD=$(grep ftp_pass /run/secrets/credentials | cut -d = -f2)

if ! id "$FTP_USER" &>/dev/null; then 
	useradd -m -s /bin/bash $FTP_USER
fi
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

mkdir -p /var/run/vsftpd/empty

usermod -d /var/www/html "$FTP_USER"

chown -R $FTP_USER:$FTP_USER /var/www/html

exec /usr/sbin/vsftpd /etc/vsftpd.conf
