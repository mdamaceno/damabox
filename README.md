# Damabox

O Damabox é uma alternativa ao XAMPP construída sobre o Docker. Com ele, você pode rodar sua aplicação PHP com servidor Nginx.

## Modo de usar

Crie um arquivo **.env** na raíz do Damabox se baseando no arquivo env-sample. Você pode serguir os passos abaixo:

``` bash
# Crie um arquivo de configuração de ambiente
$ cp env-sample .env

# Edite o arquivo de configuração
$ vim .env

# Crie um arquivo php.ini dentro de config/php/VERSAO
# para sobrescrever as configurações default do PHP (opcional)
$ vim config/php/7.1/php.ini

# Inicie todos os containers
$ docker-compose up
```

Segue um exemplo do arquivo **.env**:

```
###########################################
# Project - Apache
###########################################

PROJECT_DIR=project/directory/path
HTTP_PORT=8080

###########################################
# Firebird
###########################################

FIREBIRD_ROOT_USER=user
FIREBIRD_ROOT_PASSWORD=password
FIREBIRD_PORT=3500
FIREBIRD_DATADIR=database/directory/path
```

Dentro da pasta **config/nginx/servers** há um exemplo de configuração de server do Nginx que deverá ser duplicado com extensão **.conf**. O conteúdo do arquivo pode ser como no exemplo abaixo:

```
server {
    listen   80;

    root /app;
    index index.php index.html;

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;

        // IP do serviço PHP que será usada na aplicação. Veja o IP correspondente no arquivo docker-compose.yml
        fastcgi_pass 10.5.0.8:9000;

        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }
}
```

Para sobrescrever as configurações default do PHP, crie um arquivo php.ini dentro do diretŕoio config/php/VERSAO-UTILIZADA com os parâmetros que deseja sobrescrever.

## Contribuições

Toda contribuição é bem vinda!

Se gostou do projeto e quiser contribuir, faça um clone do projeto. Você também pode reportar bugs caso ache algum problema.

Não se esqueça de dar uma estrela no repositório :)

## Todo

- ~~Suporte ao PHP~~
- ~~Suporte ao Nginx~~
- ~~Suporte ao Firebird~~
- Suporte ao Apache
- Suporte ao MySQL
- Suporte ao PostgreSQL
- Suporte ao MongoDB
- Suporte ao Ruby
- Suporte ao Node.js
