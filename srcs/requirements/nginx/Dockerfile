# Version: 1.0

FROM debian:buster-slim

RUN apt-get update && apt-get upgrade
RUN apt-get install -y nginx

COPY conf 

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
