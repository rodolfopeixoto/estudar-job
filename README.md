![](https://www.estudar.org.br/wp-content/themes/fundacao-estudar-2/images/logo-header.png)

#### Bem-vindo à aplicação de teste

Estamos muito felizes que você tenha chegado nessa etapa do nosso processo seletivo, para essa fase, desejamos que você conclua o desafio.

O objetivo é (...)

#### Environment

Caso queira um passo a passo de instalação de como configurar o seu ambiente, pode consultar o site do [GoRails](https://gorails.com/setup/ubuntu/18.10).

```
Rails Version: 5.2.1
Ruby Version: 2.5.3
Mysql version: 5.7 or higher
Redis version: 4.0 or higher
```

#### Setup

Lembre-se de editar o arquivo `.env` com as informações do seu banco de dados MySQL e do Redis. Conferir também o arquivo de `database.yml`.

```sh
$ cp config/database.yml.sample config/database.yml
$ bin/setup
```

#### Features
- Criar um usuário em um serviço externo
..- Criar um form com nome e sobrenome
..- Verificar se o usuário existe no serviço (https://reqres.in/api/users?page=2)
..- Caso o usuário não exista criá-lo
..- Usar o serviço de fake api [Req|Res](https://reqres.in/)
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
