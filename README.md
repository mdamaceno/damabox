# Damabox

O **Damabox** é uma alternativa ao XAMPP construída sobre o Docker. Com ele, você pode rodar sua aplicação PHP com servidor Nginx.

## Pré-requisitos

- [Docker](https://docs.docker.com/install/)
- [Docker Compose](https://docs.docker.com/compose/)

## Instalação

Para instalar o Damabox, [baixe a última versão (0.2.0) em formato zip ou tar.gz](https://github.com/mdamaceno/damabox/releases), ou execute o seguinte comando no terminal:

```bash
$ git clone https://github.com/mdamaceno/damabox.git && cd damabox
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
# Damabox
###########################################

PROJECT_DIR=./data/www

DB_CONFIG_DIR=./config/db
PHP55_CONFIG_DIR=./config/php/5.5
PHP56_CONFIG_DIR=./config/php/5.6
PHP70_CONFIG_DIR=./config/php/7.0
PHP71_CONFIG_DIR=./config/php/7.1
PHP72_CONFIG_DIR=./config/php/7.2

TIMEZONE=America/Sao_Paulo

GATEWAY=10.5.0.1
SUBNET=10.5.0.0/24
IP_RANGE=10.5.0.0/24

###########################################
# Bind
###########################################

BIND_IP=10.5.0.10
BIND_TLD_SUFFIX=local
BIND_EXTRA_HOSTS=""
BIND_DNS_RESOLVER=8.8.8.8,8.8.4.4

###########################################
# Project - Nginx
###########################################

HTTP_PORT=80
HTTPS_PORT=443
NGINX_CONFIG_DIR=./config/nginx

###########################################
# Firebird
###########################################

FIREBIRD_PORT=3050
FIREBIRD_DATADIR=./data/databases/firebird

###########################################
# MySQL
###########################################

MYSQL_TYPE=mysql
MYSQL_PORT=3306
MYSQL_VERSION=5.7
MYSQL_ROOT_PASSWORD=root
MYSQL_DATADIR=./data/databases/mysql
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

O diretório `data/www/` é o local padrão para armazenar os projetos, mas isso pode ser alterado no arquivo `.env` através da variável `PROJECT_DIR=./data/www`.

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

