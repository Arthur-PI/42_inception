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
                vim \
                mariadb-client \
                curl

RUN mkdir -p /run/php
RUN mkdir -p /var/www/html

RUN wget https://wordpress.org/latest.zip -O /tmp/wordpress.zip
RUN unzip /tmp/wordpress.zip -d /tmp/wordpress ; rm /tmp/wordpress.zip
RUN mv /tmp/wordpress/* /var/www/html
RUN rmdir /tmp/wordpress
COPY ./wp-config.php /var/www/html/wordpress
RUN chown -R www-data:www-data /var/www/html/wordpress

RUN sed -ie 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /tmp/wp-cli.phar; \
    chown www-data:www-data /tmp/wp-cli.phar; \
    chmod +x /tmp/wp-cli.phar; \
    mv /tmp/wp-cli.phar /usr/local/bin/wp

COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F"]
