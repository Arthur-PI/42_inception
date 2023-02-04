# Version: 1.0
FROM debian:buster

RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y

COPY ./setup_script.sh /tmp/setup_script.sh

RUN sh /tmp/setup_script.sh
RUN rm /tmp/setup_script.sh

COPY ./docker-entrypoint.sh /usr/local/bin
# EXPOSE 3306

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mysqld"]
