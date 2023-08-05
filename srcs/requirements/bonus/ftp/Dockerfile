# Version: 1.0

FROM debian:buster

ARG FTP_PASSWD
ARG FTP_USER
ENV FTP_USER $FTP_USER

RUN apt-get update && apt-get upgrade
RUN apt-get install -y vsftpd

RUN mkdir -p /var/www/wordpress
RUN useradd -d /var/www/wordpress "$FTP_USER" && \
    usermod -aG www-data "$FTP_USER" && \
    echo "$FTP_USER:$FTP_PASSWD" | chpasswd && \
    chmod -R g+w /var/www/wordpress

COPY ./vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /var/run/vsftpd

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 21

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["vsftpd"]
