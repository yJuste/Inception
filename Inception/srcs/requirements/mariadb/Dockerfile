FROM debian:12

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb-start.sh /etc/mysql/mariadb-start.sh
RUN chmod +x /etc/mysql/mariadb-start.sh
CMD ["/etc/mysql/mariadb-start.sh"]
