#!/bin/bash

git pull origin master
docker pull maadamaceno/damabox_php5.5:latest
docker pull maadamaceno/damabox_php5.6:latest
docker pull maadamaceno/damabox_php7.0:latest
docker pull maadamaceno/damabox_php7.1:latest
docker pull maadamaceno/damabox_nginx:latest

# Firebird 3.0
# docker pull maadamaceno/damabox_hqbird:3.0

# Firebird 2.5 SuperClassic
docker pull maadamaceno/damabox_hqbird:2.5-sc

# Firebird 2.5 Classic
# docker pull maadamaceno/damabox_hqbird:2.5-classic
