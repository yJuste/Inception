COMPOSE_FILE= srcs/docker-compose.yml
DC= docker compose -f $(COMPOSE_FILE)

up:
	$(DC) start || true
	$(DC) up --remove-orphans

build: down
	mkdir -p $(HOME)/data/wordpress $(HOME)/data/mariadb
	$(DC) up --build --remove-orphans

down: clear
	if [ -d "$(HOME)/data/wordpress" ]; then rm -rf "$(HOME)/data/wordpress"; fi
	if [ -d "$(HOME)/data/mariadb" ]; then rm -rf "$(HOME)/data/mariadb"; fi
	$(DC) down -v --remove-orphans

clear:
	docker images 'mariadb:inception' -q | xargs -r docker rmi -f
	docker images 'wordpress:inception' -q | xargs -r docker rmi -f
	docker images 'nginx:inception' -q | xargs -r docker rmi -f
	docker images 'redis:inception' -q | xargs -r docker rmi -f
	docker images 'adminer:inception' -q | xargs -r docker rmi -f
	docker images 'ftp:inception' -q | xargs -r docker rmi -f
	docker images 'mariabackup:inception' -q | xargs -r docker rmi -f

restart: build

.PHONY: up build clear stop restart
