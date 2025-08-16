FROM debian:12

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y mariadb-server

COPY tools/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["bash", "/tmp/start.sh"]
CMD ["mysqld_safe"]
