# Version: 1.0
FROM debian:buster

RUN apt update && apt upgrade -y

RUN apt install -y ghostscript \
                php \
                php-bcmath \
                php-curl \
                php-imagick \
                php-intl \
                php-json \
                php-mbstring \
                php-mysql \
                php-xml \
                php-zip \
                php-fpm \
                wget \
                unzip \
                vim

RUN mkdir -p /run/php
RUN mkdir -p /var/www/html

RUN wget https://wordpress.org/latest.zip -O /tmp/wordpress.zip
RUN unzip /tmp/wordpress.zip -d /tmp/wordpress ; rm /tmp/wordpress.zip
RUN mv /tmp/wordpress/* /var/www/html

RUN sed -ie 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F"]
