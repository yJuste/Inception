FROM debian:bookworm

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y nginx
RUN apt-get install -y openssl
RUN rm -rf /var/lib/apt/lists/*
RUN mkdir -p /etc/nginx/ssl

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Création d'un certificat, auto-signé, sans password
COPY --chmod=755 tools/ssl_init.sh /usr/local/bin/ssl_init.sh
COPY --chmod=755 conf/nginx.conf /etc/nginx/nginx.template

ENTRYPOINT ["/usr/local/bin/ssl_init.sh"]
CMD ["nginx", "-g", "daemon off;"]
