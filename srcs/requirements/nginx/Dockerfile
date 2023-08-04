# Version: 1.0

FROM debian:buster

RUN apt-get update && apt-get upgrade
RUN apt-get install -y nginx openssl

ARG NGINX_DOMAIN

RUN mkdir -p "/etc/cert/$NGINX_DOMAIN" && \
    mkdir -p "/etc/cert/adminer.$NGINX_DOMAIN" && \
    mkdir -p "/etc/cert/gitea.$NGINX_DOMAIN" && \
    mkdir -p "/etc/cert/static.$NGINX_DOMAIN" && \
    mkdir -p /var/run/nginx && \
    chown -R www-data:www-data /var/run/nginx

RUN openssl req -x509 -newkey rsa:4096 -keyout "/etc/cert/$NGINX_DOMAIN/key.pem" -out "/etc/cert/$NGINX_DOMAIN/cert.pem" -sha256 -days 365 -nodes -subj "/CN=$NGINX_DOMAIN"
RUN openssl req -x509 -newkey rsa:4096 -keyout "/etc/cert/adminer.$NGINX_DOMAIN/key.pem" -out "/etc/cert/adminer.$NGINX_DOMAIN/cert.pem" -sha256 -days 365 -nodes -subj "/CN=adminer.$NGINX_DOMAIN"
RUN openssl req -x509 -newkey rsa:4096 -keyout "/etc/cert/gitea.$NGINX_DOMAIN/key.pem" -out "/etc/cert/gitea.$NGINX_DOMAIN/cert.pem" -sha256 -days 365 -nodes -subj "/CN=gitea.$NGINX_DOMAIN"
RUN openssl req -x509 -newkey rsa:4096 -keyout "/etc/cert/static.$NGINX_DOMAIN/key.pem" -out "/etc/cert/static.$NGINX_DOMAIN/cert.pem" -sha256 -days 365 -nodes -subj "/CN=static.$NGINX_DOMAIN"

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./proxy.conf /etc/nginx/proxy.conf
COPY ./wordpress.conf "/etc/nginx/conf.d/$NGINX_DOMAIN.conf"
COPY ./adminer.conf "/etc/nginx/conf.d/adminer.$NGINX_DOMAIN.conf"
COPY ./gitea.conf "/etc/nginx/conf.d/gitea.$NGINX_DOMAIN.conf"
COPY ./static.conf "/etc/nginx/conf.d/static.$NGINX_DOMAIN.conf"

RUN sed -i "s/\$NGINX_DOMAIN/$NGINX_DOMAIN/g" /etc/nginx/conf.d/*

CMD ["nginx", "-g", "daemon off;"]
