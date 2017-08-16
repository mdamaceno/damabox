#!/bin/bash

git pull origin master
docker pull maadamaceno/damabox_php5.5:latest
docker pull maadamaceno/damabox_php5.6:latest
docker pull maadamaceno/damabox_php7.0:latest
docker pull maadamaceno/damabox_php7.1:latest
docker pull maadamaceno/damabox_nginx:latest
docker pull maadamaceno/damabox_firebird:latest
