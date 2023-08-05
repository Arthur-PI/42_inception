#! /bin/bash

docker run --name db_test --rm --env-file ../../.env apigeon/mariadb
