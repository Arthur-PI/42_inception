# Version: 1.0

FROM debian:buster-slim

ARG FTP_PASSWD
ARG FTP_USER
ENV FTP_USER $FTP_USER

RUN apt-get update && apt-get upgrade
RUN apt-get install -y vsftpd

RUN mkdir -p /var/www/html/wordpress
RUN groupadd sftp && \
    adduser "$FTP_USER" --disabled-password && \
    usermod -aG sftp "$FTP_USER" && \
    echo "$FTP_USER:$FTP_PASSWD" | chpasswd

COPY ./vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /var/run/vsftpd

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["vsftpd"]
