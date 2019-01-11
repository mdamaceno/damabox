Download [the last version of Damabox in zip or tar.gz](https://github.com/mdamaceno/damabox/archive/master.zip), or open the terminal and run the following command:

```bash
$ git clone https://github.com/mdamaceno/damabox.git && cd damabox
```

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
# Firebird 2.5
###########################################

FIREBIRD25_ROOT_USER=firebirduser
FIREBIRD25_ROOT_PASSWORD=firebirdpass
FIREBIRD25_PORT=3050
FIREBIRD25_DATADIR=./data/databases/firebird
HQBIRD25_PANEL_PORT=8082
HQBIRD25_LICENSE_PORT=8765

###########################################
# Firebird 3.0
###########################################

FIREBIRD30_ROOT_USER=firebirduser
FIREBIRD30_ROOT_PASSWORD=firebirdpass
FIREBIRD30_PORT=3051
FIREBIRD30_DATADIR=./data/databases/firebird
HQBIRD30_PANEL_PORT=8083
HQBIRD30_LICENSE_PORT=8766

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

By default, `data/www` directory is the place to put/create your projects, but you can change this path setting the `PROJECT_DIR` variable in `.env` file.

### Nginx

There is a file named `nginx.conf-example` in `config/nginx` directory. Make a copy of it and name it as `nginx.conf`. This file can be changed as you need.

To setup Nginx server blocks (virtual hosts), you need to create a `project_name.conf` file in `config/nginx/sites-available`. Example of content for a project using PHP 7.2:

```C hl_lines="7 18"
# config/nginx/sites-available/project_name.conf

server {
    listen   80;

    # Directory path where the project is
    root /app/project_name;
    index index.php index.html;

    autoindex on;

    # this is the internal Docker DNS, cache only for 30s
    resolver 127.0.0.11 valid=30s;

    location ~ \.php$ {

        # using variables to set up hosts avoid Nginx startup errors when trying to access a host that is not running yet
        set $upstream php-7.2:9000;

        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass $upstream;
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
