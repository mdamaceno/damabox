# Damabox

O **Damabox** é uma alternativa ao XAMPP construída sobre o Docker. Com ele, você pode rodar sua aplicação PHP com servidor Nginx.

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

# Inicie todos os containers
$ docker-compose up --build
```

Segue um exemplo do arquivo `.env`:

```
###########################################
# Damabox
###########################################

PROJECT_DIR=./data/www
DB_CONFIG_DIR=./config/db
PHP55_CONFIG_DIR=./config/php/5.5
PHP56_CONFIG_DIR=./config/php/5.6
PHP70_CONFIG_DIR=./config/php/7.0
PHP71_CONFIG_DIR=./config/php/7.1

###########################################
# Project - Nginx
###########################################

HTTP_PORT=80
NGINX_CONFIG_DIR=./config/nginx

###########################################
# Firebird
###########################################

FIREBIRD_ROOT_USER=sysdba
FIREBIRD_ROOT_PASSWORD=masterkey
FIREBIRD_PORT=3050
FIREBIRD_DATADIR=./data/databases/firebird

###########################################
# MySQL
###########################################

MYSQL_TYPE=mysql
MYSQL_VERSION=5.7
MYSQL_PORT=3306
MYSQL_ROOT_PASSWORD=root
MYSQL_DATADIR=./data/databases/mysql
```

### Nginx

Dentro do diretório `config/nginx` há o arquivo `nginx.conf-example`. Faça uma cópia dele com o nome `nginx.conf`. Este arquivo pode ser alterado conforme sua necessidade.

Para configurar os hosts no Nginx, pode usar o arquivo `config/nginx/sites-available/default-example` como exemplo.

### PHP

Para ativar/desativar extensões e/ou alterar outras configurações do PHP, pode fazer isso através do arquivo `config/php/[VERSAO_DO_PHP]/php.ini`. Dentro do diretório de cada versão há um arquivo de exemplo que pode ser usado como modelo.

### Banco de dados

Por padrão, os arquivos de banco de dados ficam em `data/databases/[TIPO_DE_BANCO_DE_DADOS]`.

### Projetos

O diretório `data/www/` é o local padrão para armazenar os projetos, mas isso pode ser alterado no arquivo `.env` através da variável `PROJECT_DIR=./data/www`.

## Contribuições

Toda contribuição é bem vinda!

Se gostou do projeto e quiser contribuir, faça um clone do projeto e mande um pull request. Você também pode reportar bugs caso encontre algum problema.

Não se esqueça de dar uma estrela no repositório :)

