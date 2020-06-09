# EMOJIBALEIA Docker

# O que é um Container?

> " Uma unidade padronizada de software "<br/>[docker.com](https://www.docker.com/resources/what-container)

# Padronizado, leve e seguro

![](https://www.docker.com/sites/default/files/d8/styles/large/public/2018-11/container-what-is-container.png?itok=vle7kjDj)

# Container

- Container = app + dependências
- Docker é o SO do app*
  - Linux != Windows != MacOS
  - Docker não faz milagres, container Windows em ambiente linux não funciona
  - Docker está monitorando processos PID no SO, se não rodaria antes docker can't save you
- Modularização à nível de SO
  - *Separation of Concerns*, da Engenharia de Software
  - Single Responsibility Principle, do S.O.L.I.D

# Container ou VM

![](https://www.docker.com/sites/default/files/d8/2018-11/docker-containerized-and-vm-transparent-bg.png)

# Vantagens

- Deploy Heroku
- Segurança
- Praticidade
- Multiplataforma

# EMOJIFLEX Exercitar

- [Playground](https://www.docker.com/play-with-docker)

  ```shell
  # no sudo docker
  sudo usermod -aG docker $USER
  # reload group
  newgrp docker
  # docker load container
  docker run -dp 80:80 docker/getting-started
  # list containers
  docker ps
  # open on browser
  xdg-open http://localhost:80
  ```

- [Documentação](https://docs.docker.com/)

- Projetos Pessoais

# TODO Deploy Heroku

- https://devcenter.heroku.com/categories/deploying-with-docker

- https://youtu.be/7JBDgeyChfc

  

https://medium.com/better-programming/how-to-containerize-and-deploy-apps-with-docker-and-heroku-b1c49e5bc070

# Notes

- Compatibilidade com OS deixa de ser um problema
- Container vs Image
  - Imagem "Classe" Instruções
  - Container é a instância
- "Funciona no meu computador"

docker run <image>
Cria um container à partir da imagem

docker ps
list all containers currently running

docker ps -a
list all history of containers

docker stop <container name>
stop a container

docker rm <container name>
Delete container, free space

docker images
list images

docker rmi <image name>
!CAUTION: delete all dependent containers to remove a image

docker pull <image>

docker run arch sleep 5

docker exec <container name> <comand>

docker run -d <image>
detach from terminal, run in background

docker attach <container name>|<id>
access terminal inside container

docker run redis:4.0
see docker hub for more tags

docker run -it <image>|<container>
**i**nteractive **t**erminal, can be use separately

docker run -p <local>:<container> <image>|<container>
connect ports

docker run -v <local>:<container> *image*
Volume Mapping

docker inspect <container>
analyse container config

docker logs <container>

docker run -e VAR=blue <container>
environment variables

# TODO Dockerfile

Passo a passo usando o shell

docker build Dockerfile -t <container name>

Dockerfile:

- Começa com FROM <image>
- Instala dependências
- Copia arquivos
- ?? ENTRYPPOINT
  - docker run == ENTRYPOINT run
  - Se eu quiser mais de um comando?

# ENTRYPOINT ou CMD

docker run ubuntu-sleeper sleep 10

CMD sleep 5                  # tudo ou nada

docker run ubuntu-sleeper 10

ENTRYPOINT ["sleep"] # CLI command is appended

```dockerfile
FROM Ubuntu
ENTRYPOINT ["sleep"]
CMD ["5"]
```

docker run --entrypoint sleep2.0 ubuntu-sleeper 10
rewrites entrypoint

# Networking

docker run Ubuntu
Bridge -> "Playground":  isolados, mas tudo na mesma caixa

docker run Ubuntu --network=host
host -> localhost: "equivalente" a instalar na minha máquina (para fins de rede)

docker run Ubuntu --network=none
none -> isolado

# Cache é vida

Docker aproveita muito processos anteriores
Dividindo o processo de construção em camadas
Camadas quase como "commits"

# TODO docker run --mount



# [Athena](https://github.com/yuriserka/athena#readme) API

```dockerfile
FROM node:12.13
RUN mkdir /app
WORKDIR /app # container -> cd /app
#COPY <dir> <docker_dir>
COPY . .
RUN yarn install
```

# Athena Compose

```yaml
version: "3"

services:
  back:
    build: ./api # path to Dockerfile
    command: bash start.sh # CMD
    ports:
      - "8083:8083"

  front:
    depends_on:
      - "back"
    build: ./front
    command: bash start.sh
    ports:
      - "3000:3000"
```

docker-compose up

# docker-compose.yml

```yaml
version: "3" # 1, 2 ou 3
# 1 - Dockerfile mashup
# 2 - adiciona serviços, dependências e networking, ...
# 3 - 
services:
    container1:
        image: <image>
        ports:
          - <local>:<container>
    container2:
        image: <image>
        ports:
          - <local>:<container>
        depends_on:
          - container1
```

# Limitando Recursos

docker run --cpus-.5 ubuntu 			# 50%

docker run --memory=100m ubuntu # 100MB