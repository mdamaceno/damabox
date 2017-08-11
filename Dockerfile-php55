FROM php:5.5-fpm

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y \
  libmcrypt-dev \
  libcurl4-gnutls-dev \
  libxml2-dev \
  libpng-dev \
  libc-client-dev \
  libkrb5-dev \
  build-essential \
  firebird2.5-dev \
  libicu-dev \
  libldb-dev \
  libldap2-dev \
  libedit-dev \
  libsnmp-dev \
  libtidy-dev \
  libxslt-dev \
  sqlite3 \
  sqlite \
  libsqlite3-dev \
  libpq-dev \
  libmagickwand-dev \
  libmemcached-dev

COPY build/build-php-modules.sh /

RUN chmod +x /build-php-modules.sh

RUN sh /build-php-modules.sh

RUN apt-get -y autoclean && apt-get -y autoremove && apt-get -y clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
