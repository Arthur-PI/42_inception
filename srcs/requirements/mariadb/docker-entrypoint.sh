#! /bin/bash

# Start and persist mariadb
service mysql start

# Make sure that we set the root password
mariadb -e "UPDATE mysql.user SET Password = PASSWORD('$MARIADB_ROOT_PASSWD') WHERE User = 'root';" || echo "Failed to change root password"
# Disable the anonymous user
mariadb -e "DELETE FROM mysql.user WHERE USER = '';" || echo "Failed to remove anonymous users"
# Remove the demo database
mariadb -e "DROP DATABASE IF EXISTS test;" || echo "Failed to remove test database"

# Setup wordpress user and database
mariadb -e "CREATE DATABASE $WORDPRESS_DATABASE;" || echo "Failed to create $WORDPRESS_DATABASE database"
mariadb -e "CREATE USER '$WORDPRESS_USER'@'%' IDENTIFIED BY '$WORDPRESS_PASSWD';" || echo "Failed to create $WORDPRESS_USER user"
mariadb -e "GRANT ALL ON $WORDPRESS_DATABASE.* TO '$WORDPRESS_USER'@'%' IDENTIFIED BY '$WORDPRESS_PASSWD'" ||  "Failed to grand this user access to the database"

# Flush changes
mariadb -e "FLUSH PRIVILEGES;"

if [[ "$1" == 'mysqld' || "$1" == 'mysqld_safe' ]]; then
  service mysql stop
fi

exec $@