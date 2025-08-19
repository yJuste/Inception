FROM debian:bookworm

RUN apt-get update && apt-get upgrade
RUN apt-get install -y redis-server
RUN rm -rf /var/lib/apt/lists/*

COPY --chmod=755 conf/redis.conf /etc/redis/redis.conf

CMD ["redis-server", "--protected-mode", "no"]
