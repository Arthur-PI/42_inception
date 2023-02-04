#! /bin/bash

sed -ie "s/\$WORDPRESS_USER/$WORDPRESS_USER/g" /var/www/html/wordpress/wp-config.php
sed -ie "s/\$WORDPRESS_PASSWD/$WORDPRESS_PASSWD/g" /var/www/html/wordpress/wp-config.php
sed -ie "s/\$WORDPRESS_DATABASE/$WORDPRESS_DATABASE/g" /var/www/html/wordpress/wp-config.php

exec $@
