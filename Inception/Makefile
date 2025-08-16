COMPOSE_FILE = srcs/docker-compose.yml

up:
	mkdir -p $(HOME)/data/mysql
	mkdir -p $(HOME)/data/wordpress
	mkdir -p $(HOME)/data/mariadb
	docker compose -f $(COMPOSE_FILE) up --build

stop:
	if [ -d "$(HOME)/data/mysql" ]; then rm -r "$(HOME)/data/mysql"; fi
	if [ -d "$(HOME)/data/wordpress" ]; then rm -r "$(HOME)/data/wordpress"; fi
	if [ -d "$(HOME)/data/mariadb" ]; then rm -r "$(HOME)/data/mariadb"; fi
	docker compose -f $(COMPOSE_FILE) down -v --remove-orphans

clear: stop
	docker rmi -f mariadb:inception
	docker rmi -f wordpress:inception
	docker rmi -f nginx:inception

restart: clear up

.PHONY: up stop restart
