COMPOSE_FILE = srcs/docker-compose.yml

# Lance Inception
up:
	mkdir -p $(HOME)/data/wordpress
	mkdir -p $(HOME)/data/mariadb
	docker compose -f $(COMPOSE_FILE) up --build

# Supprime les containers liés à inception
clear:
	docker rmi -f mariadb:inception;
	docker rmi -f wordpress:inception;
	docker rmi -f nginx:inception;
	docker rmi -f redis:inception;
	docker rmi -f adminer:inception;

# Clean et relance
restart: clear up

# Supprime la base de données, ferme les containers, clean tout
stop: clear
	if [ -d "$(HOME)/data/wordpress" ]; then rm -r "$(HOME)/data/wordpress"; fi
	if [ -d "$(HOME)/data/mariadb" ]; then rm -r "$(HOME)/data/mariadb"; fi
	docker compose -f $(COMPOSE_FILE) down -v --remove-orphans

.PHONY: up clear restart stop
