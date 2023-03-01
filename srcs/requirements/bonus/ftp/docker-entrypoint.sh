#! /bin/bash

chown -R "$FTP_USER":sftp /var/www/wordpress

echo "Starting ftp server on port :21, you can connect with the the user $FTP_USER"

exec $@
