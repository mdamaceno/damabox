#!/bin/bash

if [[ -f ./.env ]]; then
    source ./.env
fi

echo $DB_CONFIG_DIR
