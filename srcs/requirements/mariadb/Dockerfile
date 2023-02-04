# Version: 1.0
FROM debian:buster

RUN apt update && apt upgrade -y
RUN apt install mariadb-server mariadb-client -y

COPY ./docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN sed -ie 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mysqld"]
