#! /bin/bash
set -e

echo "Starting ftp server on port :21, you can connect with the the user $FTP_USER"
exec $@
