# Damabox

O Damabox é uma alternativa ao XAMPP construída sobre o Docker. Com ele, você pode rodar sua aplicação PHP com servidor Apache.

## Modo de usar

Primeiramente, é preciso fazer o build das imagens que serão usadas no Docker. Execute os comandos abaixo na raíz do Damabox:

``` bash
# Faz o build da imagem do PHP com Apache
$ docker build -t damabox_php_apache -f Dockerfile-apache .

# Faz o build da imagem do Firebird
$ docker build -t damabox_firebird -f Dockerfile-firebird .
```

Crie um arquivo .env na raíz do Damabox se baseando no arquivo env-sample. Você pode serguir os passos abaixo:

``` bash
# Crie um arquivo de configuração de ambiente
$ cp env-sample .env

# Edite o arquivo de configuração
$ vim .env

# Inicie todos os containers
$ docker-compose up
```

## Contribuições

Toda contribuição é bem vinda!

Se gostou do projeto e quiser contribuir, faça um clone do projeto. Você também pode reportar bugs caso ache algum problema.

Não se esqueça de dar uma estrela no repositório :)

## Todo

- ~~Suporte ao PHP~~
- ~~Suporte ao Apache~~
- ~~Suporte ao Firebird~~
- Suporte ao Nginx
- Suporte ao MySQL
- Suporte ao PostgreSQL
- Suporte ao MongoDB
- Suporte ao Ruby
- Suporte ao Node.js
