# 🐋 Docker

*"Funciona no meu computador"*

# 🤔 Container?

> " Uma unidade padronizada de software "<br/>[docker.com](https://www.docker.com/resources/what-container)

# 📦 Container

- `container = app + dependências`

# 😕 Porquê

- 🧩 Modularização
  - *Separation of Concerns*
  - Single Responsibility, S.O.L.I.D

# 🚢 Docker

![](https://www.docker.com/sites/default/files/d8/styles/large/public/2018-11/container-what-is-container.png?itok=vle7kjDj)

# 🐣 Docker e Containers

- 👀🐋 [namespace](https://docs.docker.com/get-started/overview/#namespaces)

# ⚖️ Container ou VM

![](https://www.docker.com/sites/default/files/d8/2018-11/docker-containerized-and-vm-transparent-bg.png)

# 🎯 Vantagens

- 🇭 Deploy
- 🔒 Segurança
- 🤤 Praticidade
- 🤩 Multiplataforma**\***

# 🦾 Exercitar

- [Playground](https://www.docker.com/play-with-docker)

- [Documentação](https://docs.docker.com/)

- Projetos Pessoais

# 🤯 Grupo

```bash
sudo usermod -aG docker $USER
newgrp docker # reload group
```

# 🧑‍💻 Playground


  ```bash
# docker load container
docker run -dp 80:80 docker/getting-started
# list containers
docker ps
# open on browser
xdg-open http://localhost:80
  ```

# 👀 Variáveis

- `$IMAGE` Imagem "Abstrata"
- `$NAME` Container é a instância
- `$COMMAND` Shell lang

# 🍞🧈 Comandos

```bash
docker run [-d(etach)] [-p(orts)]\
   [-i(nteractive)] [-t(erminal)]\
   [-v(olume)] [-e(nvironment)]  \
   $IMAGE
docker ps [-a(ll)] # container list
docker start|stop $NAME
docker rm $NAME
```

# 🧑‍🔬 Experimento

- [MongoDB](https://hub.docker.com/_/mongo) e [Arch](https://hub.docker.com/_/archlinux)

# ➕ Extras

```bash
docker pull $IMAGE   # download only
docker exec $NAME $COMMAND
docker logs $NAME
docker inspect $NAME # show configs
```

#  ⚠️ Curiosidades

```bash
docker images     # ls images
docker rmi $IMAGE # rm image
```

# ✍️ Exemplo

- [Athena](https://github.com/yuriserka/athena#readme)
  - Node servidor
  - Vue.js frontend

# 🗒️ Dockerfile

`docker build <folder> [-t(ag) $NAME]`

1. Começa com `FROM $IMAGE`
2. Instala dependências
3. Copia arquivos
4. `ENTRYPOINT $COMMAND` **\*** (`docker run`)
5. `CMD $COMMAND`

# <img src="https://nodejs.org/static/images/logo.svg" style="zoom:25%;" />  API

```dockerfile
FROM node:12.13
RUN mkdir /app
# host >> cd /app
WORKDIR /app
# COPY <local_dir> <host_dir>
COPY . .
RUN yarn install
```

# 👑 ENTRYPOINT ou CMD

`docker run ubuntu-sleeper sleep 10`

```dockerfile
FROM Ubuntu
ENTRYPOINT ["sleep"] # concatenar
CMD ["5"]			 # substituir
```

`docker run ubuntu-sleeper 10`

# 🕸️ Networking

`docker run Ubuntu ...`

- 🌉 `--network=bridge`
- 🤵 `--network=host`
- 🏝️ `--network=none`

# 🎼 Compose

`docker-compose up`

```yaml
version: "3" # 1, 2 ou 3
# 1 - Dockerfile mashup
# 2 - adiciona serviços,
#     dependências e
#     networking, ...
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

# Athena

```yaml
# docker-compose.yml
version: "3"

services:
  back:
    # path to Dockerfile
    build: ./api
    # CMD
    command: bash start.sh
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

# Limitando Recursos

`docker run --cpus-.5 ubuntu`

`docker run --memory=100m ubuntu`

# Deploy Heroku

```bash
rails new api --api
cd /api
rails g scaffold User name:string email:string
rails db:create db:migrate
rails s
```

# Dockerfile

```dockerfile
# rails deprecated
FROM ruby:2.7.1

RUN gem install rails

RUN rails new api --api
WORKDIR /api

RUN rails g scaffold User name:string email:string
RUN rails db:create db:migrate

CMD rails s
```

# Compose

```yaml
version: "3"

services:
  api:
    build: .
    # importante configurar o listener (-b(ind))
    command: rails s -p 3000 -b '0.0.0.0'
    ports:
      - "3000:3000"
```

<!--
#  Shell

```bash
curl https://cli-assets.heroku.com/install.sh | sh
heroku login
heroku container:login
cd /path/to/repo
heroku create
#docker build docker -t rails_app
heroku container:push my_app
heroku container:release my_app
```
-->

# Extra [Deploy](https://devcenter.heroku.com/articles/container-registry-and-runtime)

# Obrigado

![]()