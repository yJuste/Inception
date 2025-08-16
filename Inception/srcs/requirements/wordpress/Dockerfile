FROM debian:12

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y wget
RUN apt-get install -y php8.2 php8.2-fpm php8.2-mysql
RUN apt-get install -y mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.8-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.8-fr_FR.tar.gz && rm -f wordpress-6.8-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress
RUN mv /var/www/wordpress /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

CMD ["php-fpm8.2", "-F"]

# CLI
#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#RUN chmod +x wp-cli.phar
#RUN mv wp-cli.phar /usr/local/bin/wp
