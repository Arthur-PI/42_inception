# Version: 1.0
FROM debian:buster

RUN apt update && apt upgrade -y
RUN apt install mariadb-server mariadb-client -y

ARG MYSQL_ROOT_PASSWD
ARG MYSQL_USER
ARG MYSQL_USER_PASSWD
ARG MYSQL_DATABASE

RUN service mysql start; \
    mariadb -e "UPDATE mysql.user SET Password = PASSWORD('$MYSQL_ROOT_PASSWD') WHERE User = 'root';"; \
    mariadb -e "DELETE FROM mysql.user WHERE USER = '';"; \
    mariadb -e "DROP DATABASE IF EXISTS test;"; \
    mariadb -e "CREATE DATABASE $MYSQL_DATABASE;"; \
    mariadb -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWD';"; \
    mariadb -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWD'"; \
    mariadb -e "FLUSH PRIVILEGES;"

COPY ./docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN sed -ie 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mysqld"]
