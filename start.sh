#!/bin/sh
source ./.env && docker run --rm -v $(pwd)/etc/ssl:/certificates -e "SERVER=$NGINX_HOST" jacoelho/generate-certificate
cp web/app/composer.json.dist web/app/composer.json
docker-compose up -d
