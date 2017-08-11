#!/bin/bash

ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so \
&& ln -s /usr/lib/x86_64-linux-gnu/liblber.so /usr/lib/liblber.so

docker-php-ext-install -j$(nproc) \
  bcmath \
  calendar \
  ctype \
  curl \
  dba \
  exif \
  fileinfo \
  gd \
  gettext \
  hash \
  iconv \
  interbase \
  intl \
  json \
  ldap \
  mbstring \
  mcrypt \
  opcache \
  pdo \
  pdo_firebird \
  pdo_mysql \
  pdo_pgsql \
  pdo_sqlite \
  phar \
  posix \
  readline \
  shmop \
  simplexml \
  snmp \
  soap \
  sockets \
  tidy \
  xml \
  xsl \
  zip

printf "\n" | pecl install imagick-beta xdebug

docker-php-ext-enable imagick xdebug
