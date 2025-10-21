#!/usr/bin/env bash
set -e
: "${UPSTREAM:?Set UPSTREAM=https://gtm.yourdomain.com}"
: "${LISTEN_PORT:=8080}"

export UPSTREAM LISTEN_PORT
envsubst '${UPSTREAM} ${LISTEN_PORT}' \
  < /etc/nginx/templates/nginx.conf.template \
  > /etc/nginx/nginx.conf

nginx -g 'daemon off;'
