#! /bin/bash
set -e

main() {
  echo "Starting ftp server on port :21, you can connect with the the user $FTP_USER"
  exec "$@"
}

main "$@"
