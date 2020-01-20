![](https://www.estudar.org.br/wp-content/themes/fundacao-estudar-2/images/logo-header.png)

#### Bem-vindo à aplicação de teste

Estamos muito felizes que você tenha chegado nessa etapa do nosso processo seletivo, para essa fase, desejamos que você conclua o desafio.

O objetivo é fazer um integração simples com um sistema externo de forma assíncrona

#### Environment

Caso queira um passo a passo de instalação de como configurar o seu ambiente, pode consultar o site do [GoRails](https://gorails.com/setup/ubuntu/18.10).

```
Rails Version: 5.2.1
Ruby Version: 2.5.3
Mysql version: 5.7 or higher
Redis version: 4.0 or higher
```

ou caso queira utilizar o docker, o projeto suporta, basta instalar o Docker e o Docker Compose, pode consultar o site do [Docker](https://docs.docker.com/compose/install/)

#### Setup

Lembre-se de editar o arquivo `.env` com as informações do seu banco de dados MySQL e do Redis. Conferir também o arquivo de `database.yml`.

```sh
$ cp config/database.yml.sample config/database.yml
$ bin/setup
```

Para utilizar o docker siga os passos abaixo:

Configurar o `config/database.yml`, adicionando ao `host` o nome o serviço `db`
```
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("DB_POOL") || 5 %>
  username: root
  password: rails
  protocol: tcp
  host: db
  reconnect: true
```

Para colocar o servidor online, utilize o comando no Linux e aguarde, será efetuado o download dos layers/images

```
  docker-compose up --build
```

O docker acaba sendo mais lento no Mac, então pode-se utilizar com o comando:

```
docker-compose -f docker-compose-mac.yml up --build
```

Para executar o `rubocop` ou `rspec spec`, você precisa estar com os containers em execução, execute o comando abaixo.

```
  docker exec -it fundacao-estudar_app_1 sh
```
O terminal estará disponível para executar os comandos abaixo:

Executar o rubocop

```
 rubocop -a
```

Executar os testes

```
 rspec spec
```
Quando executamos o rspec, automaticamente o coverage é executado também, então podemos verificar a cobertura de testes, basta acessar a pasta coverage e abrir o html index.html e estará disponível os arquivos que estão cobertos ou não.

Para acessar o sidekiq e verificar o erro, caso o usuário seja igual os cadastrados na API, basta acessar:


[![Image from Gyazo](https://i.gyazo.com/c1774573f42d1851905d8bd6ca8b319e.gif)](https://gyazo.com/c1774573f42d1851905d8bd6ca8b319e)


```
localhost:3000/sidekiq
```

A ideia era criar um sistema de notificação, onde o usuário pudesse consultar, quais registros foram processando e quais não foram, porém com o tempo não foi possível.

#### Melhorias
 - Refactory no TDD
 - Adicionar i18n em todo o fluxo
 - Adicionar um painel para visualização de todos os processos


O sistema poderá ser visualizado no Heroku [Estudar](http://user-reqres.herokuapp.com)

Sidekiq [Estudar-Sidekiq](https://user-reqres.herokuapp.com/sidekiq)


#### Features
- Criar um usuário em um serviço externo
    - Criar um form com nome e sobrenome
    - Verificar se o usuário existe no serviço (https://reqres.in/api/users?page=2)
    - Caso o usuário não exista criá-lo
    - Usar o serviço de fake api [Req|Res](https://reqres.in/)
- Usar [Interactors](https://github.com/collectiveidea/interactor)(Blog Post: [Interactors in Ruby — easy as cake, simple as pie](https://goiabada.blog/interactors-in-ruby-easy-as-cake-simple-as-pie-33f66de2eb78)).
- Utilizar o Organizer do Interactors.
- Todo o processo deve ser assíncrono

#### Critérios de avaliação

- Organização do projeto: Avalia a estrutura do projeto, documentação e uso de controle de versão;
- Coerência: Avalia se os requisitos foram atendidos;
- Boas práticas: Avalia se o projeto segue boas práticas de desenvolvimento, incluindo segurança e otimização;
- Controle de Qualidade: Avalia se o projeto possui qualidade assegurada por testes automatizados(Rspec)

#### Requisitos bônus

Esses requisitos não são obrigatórios, mas serão levados em consideração como pontos extras no momento da avaliação.

1. A aplicação rodando no Heroku ou AWS.

#### Processo de submissão

O desafio deve ser entregue pelo GitHub/Gitlab/Bitbucket.

Qualquer dúvida em relação ao desafio, responderemos por e-mail.

Bom trabalho!
