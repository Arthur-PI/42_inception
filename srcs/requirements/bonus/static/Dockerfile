# Version: 1.0

FROM debian:buster

RUN apt-get update && apt-get upgrade
RUN apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

RUN curl -fsSL https://get.pnpm.io/install.sh | bash

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN mkdir -p /static-site

COPY ./my-site /static-site/my-site

RUN cd /static-site/my-site && \
    /root/.local/share/pnpm/pnpm install && \
    /root/.local/share/pnpm/pnpm build

WORKDIR /static-site/my-site

EXPOSE 3000

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/root/.local/share/pnpm/pnpm", "start"]
