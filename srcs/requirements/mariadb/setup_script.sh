#! /bin/sh

# Start and persist mariadb
service mysql start

MARIADB_ROOT_PASSWD="root"

# Make sure that we set the root password
mariadb -e "UPDATE mysql.user SET Password = PASSWORD('$MARIADB_ROOT_PASSWD') WHER User = 'root';"
# Disable the anonymous user
mariadb -e "DELETE FROM mysql.user WHERE USER = '';"
# Remove the demo database
mariadb -e "DROP DATABASE IF EXISTS test;"
# Flush changes
mariadb -e "FLUSH PRIVILEGES"

service mysql stop
