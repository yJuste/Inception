FROM debian:bookworm

RUN apt-get update && apt-get upgrade
RUN apt-get install -y mariadb-backup mariadb-client ca-certificates tzdata cron
RUN rm -rf /var/lib/apt/lists/*

ENV TZ=${CONTINENT}/${STATE}

COPY --chmod=755 tools/backup.sh /usr/local/bin/backup.sh
RUN chmod +x /usr/local/bin/backup.sh

COPY --chmod=644 tools/backup-cron /etc/cron.d/backup-cron
RUN chmod 0644 /etc/cron.d/backup-cron

COPY --chmod=755 tools/add_env.sh /usr/local/bin/add_env.sh
ENTRYPOINT ["/usr/local/bin/add_env.sh"]

CMD ["/bin/bash", "-c", "/usr/local/bin/backup.sh && exec cron -f"]
