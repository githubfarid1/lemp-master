#!/bin/sh
HOME_DIR=/var/www/html/public
ROOT_DIR=/var/www/html
docker exec $(docker-compose ps -q php) mkdir $HOME_DIR/image/cache/ $HOME_DIR/system/storage/ $HOME_DIR/system/storage/modification/ $HOME_DIR/system/storage/logs/ $HOME_DIR/system/storage/cache/
docker exec $(docker-compose ps -q php) chmod 777 $HOME_DIR/image/cache/ $HOME_DIR/system/storage/modification/ $HOME_DIR/system/storage/logs/ $HOME_DIR/system/storage/cache/ -R
docker exec $(docker-compose ps -q php) cp $HOME_DIR/config.php.example $HOME_DIR/config.php
docker exec $(docker-compose ps -q php) cp $HOME_DIR/admin/config.php.example $HOME_DIR/admin/config.php
echo "DONE ..."
