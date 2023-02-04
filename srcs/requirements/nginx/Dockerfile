# Version: 1.0

FROM debian:buster-slim

RUN apt-get update && apt-get upgrade
RUN apt-get install -y nginx openssl

ARG DOMAIN

RUN mkdir -p "/etc/cert/$DOMAIN"

RUN openssl req -x509 -newkey rsa:4096 -keyout "/etc/cert/$DOMAIN/key.pem" -out "/etc/cert/$DOMAIN/cert.pem" -sha256 -days 365 -nodes -subj "/CN=$DOMAIN"

COPY ./nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
