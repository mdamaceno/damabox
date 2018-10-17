#!/bin/bash

if [[ -f /redis_conf/redis.conf ]]; then
  rm /usr/local/etc/redis/redis.conf
  cp /redis_conf/redis.conf /usr/local/etc/redis/
fi

redis-server /usr/local/etc/redis/redis.conf --requirepass $REDIS_PASSWORD
