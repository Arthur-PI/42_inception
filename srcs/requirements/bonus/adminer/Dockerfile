# Version: 1.0

FROM debian:buster-slim

RUN apt-get update && apt-get upgrade
RUN apt-get install -y wget \
                       php \
                       php-mysql \
                       php-fpm \
                       php-common \
                       php-cli \
                       php-json \
                       php-opcache \
                       php-readline

RUN mkdir -p /run/php
RUN mkdir -p /var/www/adminer
ADD https://www.adminer.org/latest.php /var/www/adminer/index.php
ADD https://raw.githubusercontent.com/pepa-linha/Adminer-Design-Dark/master/adminer.css /var/www/adminer/adminer.css

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN chown -R www-data:www-data /var/www/adminer

WORKDIR /var/www/adminer

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/php-fpm7.3", "-F"]
