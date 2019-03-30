# Damabox

O **Damabox** é uma alternativa ao XAMPP construída sobre o Docker. Com ele, você pode rodar sua aplicação PHP com servidor Nginx e bases de dados MySQL, MariaDB, Percona, Postgres e Firebird.

## Pré-requisitos

- [Docker](https://docs.docker.com/install/)
- [Docker Compose](https://docs.docker.com/compose/)

## Instalação

Para instalar o Damabox, [baixe a última versão (0.2.0) em formato zip ou tar.gz](https://github.com/mdamaceno/damabox/releases/tag/v0.2.0), ou execute o seguinte comando no terminal:

```bash
$ git clone --branch 0.2.0 https://github.com/mdamaceno/damabox.git && cd damabox
```

## Modo de usar

Crie um arquivo `.env` na raíz do Damabox se baseando no arquivo `env-example`. Você pode seguir os passos abaixo:

``` bash
# Crie um arquivo de configuração de ambiente
$ cp env-example .env

# Edite o arquivo de configuração (opcional)
$ vim .env

# Crie um arquivo php.ini dentro de config/php/VERSAO
# para sobrescrever as configurações default do PHP (opcional).
# Verifique o arquivo de exemplo config/php/7.1/php.ini-example
$ vim config/php/7.1/php.ini

```

Segue um exemplo do arquivo `.env`:

```bash
###########################################
# GLOBALS
###########################################

 # used by all containers
TIMEZONE=America/Sao_Paulo

# used by all containers
GATEWAY=10.5.0.1
SUBNET=10.5.0.0/24
IP_RANGE=10.5.0.0/24

 # used by nginx and php to access your script files outside the containers
PUBLIC_DATA_DIR=./data/www

# used by all containers to access your ssh-key directory outside the containers
SSH_KEYS=


###########################################
# Bind
###########################################

BIND_IP=10.5.0.10
BIND_TLD_SUFFIX=local
BIND_EXTRA_HOSTS=""
BIND_DNS_RESOLVER=8.8.8.8,8.8.4.4

###########################################
# Nginx
###########################################

NGINX_HTTP_PORT=80
NGINX_HTTPS_PORT=443

###########################################
# PHP
###########################################

# nothing to setup

###########################################
# MySQL / MariaDB / Percona
###########################################

MYSQL_TYPE=mysql
MYSQL_PORT=3306
MYSQL_VERSION=5.7
MYSQL_ROOT_PASSWORD=root
MYSQL_BASE_DATA_DIR=./data/db


###########################################
# Postgres
###########################################

POSTGRES_PORT=8080
POSTGRES_VERSION=11.2
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DATA_DIR=./data/db/postgres

###########################################
# Redis
###########################################

REDIS_PORT=6379
REDIS_PASSWORD=redis
REDIS_DATA_DIR=./data/db/redis

###########################################
# Firebird 2.5
###########################################

FIREBIRD25_PORT=3050
HQBIRD25_PANEL_PORT=8082
HQBIRD25_LICENSE_PORT=8765
FIREBIRD25_DATA_DIR=./data/db/firebird/2.5

###########################################
# Firebird 3.0
###########################################

FIREBIRD30_PORT=3051
HQBIRD30_PANEL_PORT=8083
HQBIRD30_LICENSE_PORT=8766
FIREBIRD30_DATA_DIR=./data/db/firebird/3.0
```

### Nginx

Dentro do diretório `config/nginx` há o arquivo `nginx.conf-example`. Faça uma cópia dele com o nome `nginx.conf`. Este arquivo pode ser alterado conforme sua necessidade.

Para configurar os hosts no Nginx, pode usar o arquivo `config/nginx/sites-available/default-example` como exemplo.

Na definição de `server_name`, o nome deve ter como sufixo o valor da variável `BIND_TLD_SUFFIX` (padrão: local). Ex.: `server_name nome_do_projeto.local;`

### PHP

Para ativar/desativar extensões e/ou alterar outras configurações do PHP, pode fazer isso através do arquivo `config/php/[VERSAO_DO_PHP]/php.ini`. Dentro do diretório de cada versão há um arquivo de exemplo que pode ser usado como modelo.

### Banco de dados

Por padrão, os arquivos de banco de dados ficam em `data/databases/[TIPO_DE_BANCO_DE_DADOS]`.

### Projetos

O diretório `data/www/` é o local padrão para armazenar os projetos, mas isso pode ser alterado no arquivo `.env` através da variável `PUBLIC_DATA_DIR=./data/www`.

Depois de feitas as configurações necessárias, o Damabox pode ser inicializado com o seguinte comando:

```bash
# Inicie todos os containers
$ docker-compose up --build

# Para iniciar containers específicos:
$ docker-compose up --build servico1 servico2
```

## Acesso

Para acessar os containers a partir do seu host deve ser usado o endereço IP `10.5.0.1` que é definido no arquivo `docker-compose.yml`. Ex.: `10.5.0.1:3050` para acessar o banco de dados Firebird, `10.5.0.1:3306` para acesar banco de dados MySQL.

Depois de feitas todas as configurações na aplicação do Damabox, é necessário incluir o IP definido na variável `BIND_IP` como servidor de DNS na sua rede local.

## Contribuições

Toda contribuição é bem vinda!

Se gostou do projeto e quiser contribuir, faça um clone do projeto e mande um pull request. Você também pode reportar bugs caso encontre algum problema.

Não se esqueça de dar uma estrela no repositório :)

