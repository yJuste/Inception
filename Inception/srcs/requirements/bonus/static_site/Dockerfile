FROM debian:bookworm

RUN apt-get update && apt-get upgrade
RUN apt-get install -y nginx-light
RUN rm -rf /var/lib/apt/lists/*

RUN rm -rf /var/www/html/*

COPY portfolio/ /var/www/html

CMD ["nginx", "-g", "daemon off;"]
