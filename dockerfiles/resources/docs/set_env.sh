#!/bin/bash

set -e

if [ "$DOCS_ENV" = "production" ]; then
  mkdocs build 
else
  mkdocs serve -a 0.0.0.0:$DOCS_PORT
fi
