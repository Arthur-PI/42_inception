#! /bin/bash

sed -ie "s/\$MYSQL_USER_PASSWD/$MYSQL_USER_PASSWD/g" /var/www/html/wordpress/wp-config.php
sed -ie "s/\$MYSQL_USER/$MYSQL_USER/g" /var/www/html/wordpress/wp-config.php
sed -ie "s/\$MYSQL_DATABASE/$MYSQL_DATABASE/g" /var/www/html/wordpress/wp-config.php
sed -ie "s/\$MYSQL_HOST/$MYSQL_HOST/g" /var/www/html/wordpress/wp-config.php

wp core install --path='/var/www/html/wordpress' --url='localhost' \
  --title="$WORDPRESS_SITE_TITLE" --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASSWD" \
  --admin_email="$WORDPRESS_ADMIN_EMAIL" --allow-root

echo "WordPress theme changed to 'twenty twenty two'"
wp theme install --path='/var/www/html/wordpress' --force --activate twentytwentytwo --allow-root

echo "Running php-fpm on port :9000 ..."
exec $@
