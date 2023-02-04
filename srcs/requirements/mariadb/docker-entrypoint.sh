#! /bin/bash

if [[ "$1" != 'mysqld' && "$1" != 'mysqld_safe' ]]; then
  service mysql start
fi

exec $@