#!/bin/ash

wp config create --allow-root --path=/var/www/wordpress --dbname=$DATABASE_NAME --dbuser=$DATABASE_USER --dbpass=$DATABASE_USER_PASSWORD --dbhost=$WP_DB_HOST --dbprefix='wp_' --dbcharset="utf8"

wp core install --allow-root --path=/var/www/wordpress --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_ADMIN_EMAIL

wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWD --allow-root

php-fpm81 -F