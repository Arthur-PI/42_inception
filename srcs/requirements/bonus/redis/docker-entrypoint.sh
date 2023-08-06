#! /bin/bash

main() {
  echo "Starting redis server on port :6379"
  exec "$@"
}

main "$@"
