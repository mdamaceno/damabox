## Configuration

Make a copy of `env-example` and name the file as `.env` in the root of Damabox. You can follow the steps below:

```bash
# Step 1
# Create a environment configuration file
$ cp env-example .env

# Step 2
# Edit the .env file (optional)
$ vim .env

# Step 3
# Create a file named php.ini in config/php/VERSION_PHP
# to overwrite the default configuration of PHP (opcional).
# Check out the file config/php/7.1/php.ini-example and use it as a example
$ vim config/php/7.1/php.ini
```

Take a look at a example of `.env` file:

```bash
###########################################
# Damabox
###########################################

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
# Docs
###########################################

DOCS_ENV=local
DOCS_PORT=8888

###########################################
# Bind
###########################################

BIND_IP=10.5.0.10
BIND_TLD_SUFFIX=local
BIND_EXTRA_HOSTS=
BIND_DNS_RESOLVER=8.8.8.8,8.8.4.4

###########################################
# Project - Nginx
###########################################

PROJECT_DIR=./data/www

HTTP_PORT=80
HTTPS_PORT=443
NGINX_CONFIG_DIR=./config/nginx

###########################################
# Firebird
###########################################

FIREBIRD_ROOT_USER=firebirduser
FIREBIRD_ROOT_PASSWORD=firebirdpass
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
### Projects

By default, `data/www` directory is the place to put/create your projects, but you can change this behaviour changing `PROJECT_DIR` variable in `.env` file.

### Nginx

There is a file named `nginx.conf-example` in `config/nginx` directory. Make a copy of it and name it as `nginx.conf`. This file can be changed as you need.

To setup Nginx server blocks (virtual hosts), you need to create a `project_name.conf` file in `config/nginx/sites-available`. Example of content for a project using PHP 7.1:

```C hl_lines="7 14"
# config/nginx/sites-available/project_name.conf

server {
    listen 80;

    # Directory where the projects are in the container
    root /app/project_name;
    index index.php index.html;

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        # PHP 7.1 instance
        fastcgi_pass php-7.1:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }
}
```

For more information, check out [Nginx documentation](https://nginx.org/en/docs/).

### PHP

To enable a PHP extension and/or change other configuration, create a file named `php.ini` in `config/php/[PHP_VERSION]` directory.

For more information, check out [PHP documentation](http://php.net/manual/en/configuration.file.php).

### Node.js

The lastest LTS version of Node.js is installed on each PHP container.

### Database

By default, the databases are located in `data/databases/[firebird/mariadb/mysql]`. Configuration files for databases are located in `config/db/[firebird/mariadb/mysql]`.

## Running

After doing all of configuration, it's time to run Damabox!

```bash
# Start all the containers
$ docker-compose up --build

# Or

# Start specific containers:
$ docker-compose up --build service1 service2

# Ctrl-C to stop containers
```

## Available services

- `php-5.5`
- `php-5.6`
- `php-7.0`
- `php-7.1`
- `php-7.2`
- `mysql`
- `firebird-2.5`
- `docs`
