# Version: 1.0
FROM debian:buster

RUN apt update && apt upgrade -y
RUN apt install mariadb-server mariadb-client -y

ARG MARIADB_ROOT_PASSWD
ARG WORDPRESS_DATABASE
ARG WORDPRESS_USER
ARG WORDPRESS_PASSWD

RUN service mysql start; \
    mariadb -e "UPDATE mysql.user SET Password = PASSWORD('$MARIADB_ROOT_PASSWD') WHERE User = 'root';"; \
    mariadb -e "DELETE FROM mysql.user WHERE USER = '';"; \
    mariadb -e "DROP DATABASE IF EXISTS test;"; \
    mariadb -e "CREATE DATABASE $WORDPRESS_DATABASE;"; \
    mariadb -e "CREATE USER '$WORDPRESS_USER'@'%' IDENTIFIED BY '$WORDPRESS_PASSWD';"; \
    mariadb -e "GRANT ALL ON $WORDPRESS_DATABASE.* TO '$WORDPRESS_USER'@'%' IDENTIFIED BY '$WORDPRESS_PASSWD'"; \
    mariadb -e "FLUSH PRIVILEGES;"

COPY ./docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN sed -ie 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mysqld"]
