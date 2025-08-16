COMPOSE_FILE = srcs/docker-compose.yml

up:
	mkdir -p $(HOME)/data/wordpress
	mkdir -p $(HOME)/data/mariadb
	docker compose -f $(COMPOSE_FILE) up --build

stop:
	if [ -d "$(HOME)/data/wordpress" ]; then rm -r "$(HOME)/data/wordpress"; fi
	if [ -d "$(HOME)/data/mariadb" ]; then rm -r "$(HOME)/data/mariadb"; fi
	docker compose -f $(COMPOSE_FILE) down -v --remove-orphans

clear: stop
	if docker image inspect mariadb:inception >/dev/null 2>&1; then \
		docker rmi -f mariadb:inception; fi
	if docker image inspect wordpress:inception >/dev/null 2>&1; then \
		docker rmi -f wordpress:inception; fi
	if docker image inspect nginx:inception >/dev/null 2>&1; then \
		docker rmi -f nginx:inception; fi
	if docker image inspect redis:inception >/dev/null 2>&1; then \
		docker rmi -f redis:inception; fi

restart: clear up

.PHONY: up stop clear restart
