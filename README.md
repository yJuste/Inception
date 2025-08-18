# Inception Walktrough

* Installer la VM ( Virtual Box ) :
```
https://www.virtualbox.org/wiki/Downloads
```
* Installer l'ISO d'ubuntu ( je choisis ubuntu 24.04.2 LTS ) :
```
https://ubuntu.com/download/desktop
```
-> Commandes :
apt update, apt upgrade, apt install [vim/make/git]
* Installer docker :
```
https://docs.docker.com/engine/install/ubuntu/
```
-> Commandes ( C_ -> 'container', I_ -> 'image', V_ -> 'volume', N_ -> 'network' D_ -> 'docker itself' ) ( docker + ) :
```
help, -v, ps -a, images, rm [C_ID],  rmi [I_ID]
docker build -t [I_NAME] [dossier], run [--rm] -it [I_NAME]
start [-ai] [C_ID], stop [C_ID], exec -it [C_ID] bash
cp [C_ID]:[src] [dst]

mapper: run -it [--rm] -v [path/volume]:[D_path] [I_NAME]
manager ( run-le comme mapper ) ( docker volume + ): create [V_NAME], ls, rm [V_NAME], inspect [V_NAME]
-p [my_port]:[service_port]

( network + ): ls, create [N_NAME], run [...] --network=[N_NAME] --name=[name] [I_NAME]
build -t [C_name] [path du Dockerfile], tag [I_name] [username/repository], push [username/repository]
```

* Installer docker-compose:
```
apt install docker-compose
```
-> Commandes: ( docker compose + ):
```
up [-d] [--build], stop, rm [C_NAME]
```
-> Creer un volume pour stocker les datas. Pour voir ce fichier en dehors, fais comme si tu mapper ( donc tu crees une copie. )

# EOF

Modifié le 16 Aout 2025
