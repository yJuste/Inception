# Inception Walkthrough

* You have everything you need in Inception/help.txt, two versions are available:
	- help.en.txt   🇺🇸
	- help.fr.txt   🇫🇷

* Install the VM (VirtualBox):
```
https://www.virtualbox.org/wiki/Downloads
```
* Install the Debian ISO :
```
https://cdimage.debian.org/debian-cd/current/arm64/iso-cd/		# Macos
https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/		# Linux
```
-> Useful commands to configure the VM :
apt update, apt upgrade, apt install [vim/make/git]

* Install docker :
```
https://docs.docker.com/engine/install/debian/
```
-> Commands ( C_ -> 'container', I_ -> 'image', V_ -> 'volume', N_ -> 'network' D_ -> 'docker itself' ) ( docker + ) :
```
help, -v, ps -a, images, rm [C_ID],  rmi [I_ID]
docker build -t [I_NAME] [dossier], run [--rm] -it [I_NAME]
start [-ai] [C_ID], stop [C_ID], exec -it [C_ID] bash
cp [C_ID]:[src] [dst]

volume mount: run -it [--rm] -v [path/volume]:[D_path] [I_NAME]
volume management ( run-le comme mapper ) ( docker volume + ): create [V_NAME], ls, rm [V_NAME], inspect [V_NAME]
-p [my_port]:[service_port]

( network + ): ls, create [N_NAME], run [...] --network=[N_NAME] --name=[name] [I_NAME]
build -t [C_name] [path du Dockerfile], tag [I_name] [username/repository], push [username/repository]
```

* Installe docker-compose :
```
apt install docker-compose
```
-> Commands: ( docker compose + ):
```
up [-d] [--build], stop, rm [C_NAME]
```
-> Create a volume to store data. To access this file externally, treat it like a mapper (so you're making a copy).

# EOF

Modified August 19, 2025
