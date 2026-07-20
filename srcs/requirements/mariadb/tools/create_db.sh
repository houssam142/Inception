#!/bin/bash

mkdir -p /run/mysqld /var/lib/mysql
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

DB_PASSWORD=$(cat /run/secrets/db_password)

# Initialize database if empty
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --ldata=/var/lib/mysql
fi

# Start temporary server
mysqld --user=mysql &

# Wait until MariaDB is ready
until mysqladmin ping --silent; do
    sleep 1
done

# Create database and user
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS ${DB_DATABASE};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_DATABASE}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

chown -R mysql:mysql /var/lib/mysql

mysqladmin shutdown

exec mysqld --user=mysql
