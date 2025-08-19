FROM debian:bookworm

RUN apt-get update && apt-get upgrade
RUN apt-get install -y nginx openssl
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY --chmod=755 tools/ssl_init.sh /usr/local/bin/ssl_init.sh
COPY --chmod=755 conf/nginx.conf /etc/nginx/nginx.template

ENTRYPOINT ["/usr/local/bin/ssl_init.sh"]
CMD ["nginx", "-g", "daemon off;"]
