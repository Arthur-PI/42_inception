#! /bin/bash

docker run --rm --name wp_test --env-file ../../.env -e "MYSQL_HOST=172.17.0.2" mywordpress