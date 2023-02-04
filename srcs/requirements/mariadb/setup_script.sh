#! /bin/sh

# Start and persist mariadb
service mysql start

MARIADB_ROOT_PASSWD='root'
WORDPRESS_USER='wordpress'
WORDPRESS_DATABASE='wordpress'
WORDPRESS_PASSWD='wordpress'

# Make sure that we set the root password
mariadb -e "UPDATE mysql.user SET Password = PASSWORD('$MARIADB_ROOT_PASSWD') WHERE User = 'root';"
# Disable the anonymous user
mariadb -e "DELETE FROM mysql.user WHERE USER = '';"
# Remove the demo database
mariadb -e "DROP DATABASE IF EXISTS test;"

# Setup wordpress user and database
mariadb -e "CREATE DATABASE $WORDPRESS_DATABASE;"
mariadb -e "CREATE USER '$WORDPRESS_USER'@'localhost' IDENTIFIED BY '$WORDPRESS_PASSWD';"
mariadb -e "GRANT ALL ON $WORDPRESS_DATABASE.* TO '$WORDPRESS_USER'@'localhost' IDENTIFIED BY '$WORDPRESS_PASSWD'"

# Flush changes
mariadb -e "FLUSH PRIVILEGES;"

service mysql stop
