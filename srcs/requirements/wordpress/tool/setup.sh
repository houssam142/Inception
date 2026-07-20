#!/bin/bash
set -e

ADMIN_USER=$(grep admin_user /run/secrets/credentials | cut -d = -f2)
ADMIN_PASS=$(grep admin_password /run/secrets/credentials | cut -d = -f2)
ADMIN_EMAIL=$(grep admin_email /run/secrets/credentials | cut -d = -f2)
WP_PASSWORD=$(grep user_pass /run/secrets/credentials | cut -d = -f2)
DB_PASSWORD=$(cat /run/secrets/db_password)
cd /var/www/html

if [ ! -f index.php ]; then

    curl -O https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    rm latest.tar.gz
    mv wordpress/* .
    rm -rf wordpress

    cp wp-config-sample.php wp-config.php


    sed -i "s/database_name_here/${DB_DATABASE}/" wp-config.php
    sed -i "s/username_here/${DB_USER}/" wp-config.php
    sed -i "s/password_here/${DB_PASSWORD}/" wp-config.php
    sed -i "s/localhost/${DB_HOST}/" wp-config.php


    until nc -zv mariadb 3306; do
    	sleep 1
    done

    chown -R www-data:www-data /var/www/html

    wp core install \
	--url="$DOMAIN_NAME" \
	--title="Inception" \
	--admin_user="$WP_ADMIN" \
	--admin_password="$ADMIN_PASS" \
	--admin_email="$WP_ADMIN_EMAIL" \
	--path="/var/www/html" \
	--allow-root

    wp user create $WP_USER $WP_USER_EMAIL \
	--allow-root \
	--user_pass="$WP_PASSWORD" \
	--path="/var/www/html"
    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --allow-root   
    wp plugin install redis-cache \
	--activate \
	--allow-root

    wp redis enable \
	--allow-root
fi

exec php-fpm8.2 -F
