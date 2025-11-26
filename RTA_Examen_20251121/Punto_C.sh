#!/bin/bash

## ---------------------------------------------
#  Punto C - Comandos utilizados para crear la imagen y ejecutar
### ---------------------------------------------

# 1) Crear la estructura de directorios del examen
mkdir -p ~/UTN-FRA_SO_Examenes/202411/docker/web/file
mkdir -p ~/UTN-FRA_SO_Examenes/202411/docker/web/scripts

# 2) Crear el archivo index.html (se editó con nano/vim)
# (solo registramos que se creó y editó)
nano ~/UTN-FRA_SO_Examenes/202411/docker/web/index.html

# 3) Crear archivo info.txt con los datos del usuario
echo "Nombre: nsanchez" > ~/UTN-FRA_SO_Examenes/202411/docker/web/file/info.txt
echo "ID: 1002" >> ~/UTN-FRA_SO_Examenes/202411/docker/web/file/info.txt
echo "Hash: \$y\$j9T\$iE0DRLbGfFiwcjL.7WPP..." >> ~/UTN-FRA_SO_Examenes/202411/docker/web/file/info.txt

# 4) Crear los scripts JS requeridos
nano ~/UTN-FRA_SO_Examenes/202411/docker/web/scripts/get-current-date.js
nano ~/UTN-FRA_SO_Examenes/202411/docker/web/scripts/get-ip-publica.js
nano ~/UTN-FRA_SO_Examenes/202411/docker/web/scripts/get-file-content.js

# 5) Crear el Dockerfile
nano ~/UTN-FRA_SO_Examenes/202411/docker/Dockerfile

# 6) Contenido que se colocó en el Dockerfile:
# FROM nginx:latest
# COPY ./web /usr/share/nginx/html

# 7) Construir la imagen Docker local
cd ~/UTN-FRA_SO_Examenes/202411/docker
sudo docker build -t nsanchez/web2-nsanchez:latest .

# 8) Iniciar sesión en Docker Hub (web-based login)
sudo docker login

# 9) Taguear la imagen con el usuario correcto de Docker Hub
sudo docker tag nsanchez/web2-nsanchez:latest nicolashs32/web2-nsanchez:latest

# 10) Subir la imagen a Docker Hub
sudo docker push nicolashs32/web2-nsanchez:latest

# 11) Crear archivo docker-compose.yml
nano ~/UTN-FRA_SO_Examenes/202411/docker/docker-compose.yml

# 12) Contenido usado en docker-compose.yml:
# version: '3'
# services:
#   web:
#     image: nsanchez/web2-nsanchez:latest
#     ports:
#       - "81:80"
#     volumes:
#       - ./web/file:/usr/share/nginx/html/file

# 13) Levantar el servicio con Docker Compose
sudo docker compose up -d

# 14) Verificar que el contenedor está corriendo
sudo docker ps

# 15) Obtener IP de la interfaz para acceder desde el navegador
ip a
