FROM debian:12

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y nginx

RUN mkdir -p /etc/nginx/ssl
RUN apt-get install openssl -y

# création d'un certificat, auto-signé, sans password
RUN openssl req -x509 -nodes \
-out /etc/nginx/ssl/inception.crt \
-keyout /etc/nginx/ssl/inception.key \
-subj "/C=FR/ST=Occitanie/L=Perpignan/O=42/OU=42/CN=jlongin.42.fr/UID=jlongin"

# RUN mkdir -p /var/run/nginx

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]
