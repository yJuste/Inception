FROM debian:bookworm

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y apache2 php libapache2-mod-php php-mysql wget

WORKDIR /var/www/html
RUN wget "https://www.adminer.org/static/download/5.3.0/adminer-5.3.0.php" -O index.php
RUN chown www-data:www-data index.php
RUN chmod 755 index.php
RUN rm -f index.html

RUN sed -i "s/Listen 80/Listen 8080/g" /etc/apache2/ports.conf
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
