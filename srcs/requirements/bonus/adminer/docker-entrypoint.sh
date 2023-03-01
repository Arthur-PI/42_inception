#! /bin/bash

chown -R www-data:www-data /var/www/adminer

echo "Starting php-fpm on port :9000"

exec $@
