# Version: 1.0

FROM debian:buster-slim

RUN apt-get update && apt-get upgrade && apt-get install -y nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
