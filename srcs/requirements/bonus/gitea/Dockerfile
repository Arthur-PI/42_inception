# Version: 1.0

FROM debian:buster

RUN apt-get update && apt-get upgrade
RUN apt-get install -y git wget

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN wget -O /usr/local/bin/gitea https://github.com/go-gitea/gitea/releases/download/v1.20.2/gitea-1.20.2-linux-arm64
RUN chmod +x /usr/local/bin/gitea

RUN adduser --system --shell /bin/bash --gecos 'Git Version Control' --group --disabled-password --home /home/git git

RUN mkdir -p /var/lib/gitea/custom/conf && \
    mkdir -p /var/lib/gitea/data && \
    mkdir -p /var/lib/gitea/log && \
    chown -R git:git /var/lib/gitea && \
    chmod -R 750 /var/lib/gitea && \
    mkdir /etc/gitea && \
    chown root:git /etc/gitea && \
    chmod 770 /etc/gitea

RUN chown root:git /usr/local/bin/gitea

COPY --chown=git:git ./app.ini /home/git/

ENV GITEA_WORK_DIR=/var/lib/gitea/

USER git

EXPOSE 3000

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["gitea -c /home/git/app.ini"]
