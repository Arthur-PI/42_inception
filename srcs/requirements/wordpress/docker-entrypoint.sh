#! /bin/bash
set -e

chown -R $USER:$USER /var/www/wordpress
sed "s/\$MYSQL_USER_PASSWD/$MYSQL_USER_PASSWD/g" /var/www/wordpress/wp-config.php
sed "s/\$MYSQL_USER/$MYSQL_USER/g" /var/www/wordpress/wp-config.php
sed "s/\$MYSQL_DATABASE/$MYSQL_DATABASE/g" /var/www/wordpress/wp-config.php
sed "s/\$MYSQL_HOST/$MYSQL_HOST/g" /var/www/wordpress/wp-config.php

echo "Installing WordPress website..."
wp core install \
  --allow-root \
  --url='apigeon.42.fr' \
  --title="$WORDPRESS_SITE_TITLE" \
  --admin_user="$WORDPRESS_ADMIN_USER" \
  --admin_password="$WORDPRESS_ADMIN_PASSWD" \
  --admin_email="$WORDPRESS_ADMIN_EMAIL" \

wp user create "$WORDPRESS_AUTHOR" "$WORDPRESS_AUTHOR_EMAIL" \
  --allow-root \
  --role=author \
  --user_pass="$WORDPRESS_AUTHOR_PASSWD"

echo "Updating WordPress plugins..."
wp plugin update
  --allow-root
  --all

echo "WordPress theme changed to 'twenty twenty two'"
wp theme install \
  --allow-root \
  --force \
  --activate twentytwentytwo

# --- BONUS part ---
echo "Installing and activating the redis-cache plugin..."
wp plugin install \
  --activate \
  --allow-root redis-cache

wp --allow-root plugin install wp-redis
wp --allow-root redis enable
# --- BONUS part ---

echo "Running php-fpm on port :9000 ..."
exec $@
