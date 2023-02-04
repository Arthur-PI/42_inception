# Version: 1.0
FROM debian:buster

RUN apt update && apt upgrade -y
RUN apt install mariadb-server mariadb-client -y

COPY ./docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mysqld"]
