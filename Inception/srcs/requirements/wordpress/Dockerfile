FROM debian:bookworm

RUN apt-get update && apt-get upgrade
RUN apt-get install -y curl php8.2-fpm php8.2-mysql php8.2-redis mariadb-client
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY --chmod=755 conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY --chmod=755 tools/wp_init.sh /usr/local/bin/wp_init.sh

ENTRYPOINT ["/usr/local/bin/wp_init.sh"]
CMD ["php-fpm8.2", "-F"]
