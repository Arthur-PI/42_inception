# Version: 1.0

FROM debian:buster

RUN apt-get update && apt-get upgrade
RUN apt-get install -y lsb-release redis

COPY ./redis.conf /etc/redis/redis.conf

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["redis-server", "/etc/redis/redis.conf"]
