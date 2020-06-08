# EMOJIBALEIA Docker

# O que é um Container?

> " Uma unidade padronizada de software "<br/>[docker.com](https://www.docker.com/resources/what-container)

# Padronizado, leve e seguro

![](https://www.docker.com/sites/default/files/d8/styles/large/public/2018-11/container-what-is-container.png?itok=vle7kjDj)

# Container

- Container = app + dependências
- Docker é o SO do app
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