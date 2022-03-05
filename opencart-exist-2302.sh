#!/bin/sh
echo "BEGIN ..."
HOME_DIR=/var/www/html/public
ROOT_DIR=/var/www/html

docker exec $(docker-compose ps -q php) chmod 777 $HOME_DIR/image/cache/ $HOME_DIR/system/storage/modification/ $HOME_DIR/system/storage/logs/ $HOME_DIR/system/storage/cache/ -R
