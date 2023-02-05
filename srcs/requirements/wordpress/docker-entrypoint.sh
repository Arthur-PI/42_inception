#! /bin/bash

sed -ie "s/\$WORDPRESS_USER/$WORDPRESS_USER/g" /var/www/html/wordpress/wp-config.php
sed -ie "s/\$WORDPRESS_PASSWD/$WORDPRESS_PASSWD/g" /var/www/html/wordpress/wp-config.php
sed -ie "s/\$WORDPRESS_DATABASE/$WORDPRESS_DATABASE/g" /var/www/html/wordpress/wp-config.php

wp core install --path='/var/www/html/wordpress' --url='localhost' \
  --title="Arthur's Blog" --admin_user='arthur' --admin_password='arthur' \
  --admin_email='apigeon@student.42.fr' --allow-root

exec $@
