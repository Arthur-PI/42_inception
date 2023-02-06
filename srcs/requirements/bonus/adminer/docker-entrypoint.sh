#! /bin/bash

wget https://www.adminer.org/latest.php -O /var/www/html/wordpress/adminer/index.php
chown -R www-data:www-data /var/www/html/wordpress/adminer

echo "Starting php-fpm on port :9000"

exec $@
