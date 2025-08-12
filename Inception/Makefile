up:
	docker compose -f srcs/docker-compose.yml up --build

stop:
	docker compose -f srcs/docker-compose.yml stop

restart:
	docker compose -f srcs/docker-compose.yml stop
	docker compose -f srcs/docker-compose.yml up --build

.PHONY: up stop restart
