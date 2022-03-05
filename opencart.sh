#!/bin/sh
echo "BEGIN ..."
HOME_DIR=/var/www/html/public
ROOT_DIR=/var/www/html

docker exec $(docker-compose ps -q php) chmod 777 -R $HOME_DIR/system/storage
echo "Set $HOME_DIR/system/storage to chmod 777 applied"


if [ -f "$(pwd)/web/public/config.php" ]; then
    echo "$HOME_DIR/config.php exist!"
else 
    docker exec $(docker-compose ps -q php) mv $HOME_DIR/config-dist.php $HOME_DIR/config.php
    echo "$HOME_DIR/config.php created!"
fi

if [ -f "$(pwd)/web/public/admin/config.php" ]; then
    echo "$HOME_DIR/admin/config.php exist!"
else 
docker exec $(docker-compose ps -q php) mv $HOME_DIR/admin/config-dist.php $HOME_DIR/admin/config.php
echo "$HOME_DIR/admin/config.php created!"
fi

docker exec $(docker-compose ps -q php) chmod 777 $ROOT_DIR $HOME_DIR/image/ $HOME_DIR/image/cache/ $HOME_DIR/image/catalog/
echo "Set $HOME_DIR/image/, $HOME_DIR/image/cache/,  $HOME_DIR/image/catalog/ to chmod 777 applied"

docker exec $(docker-compose ps -q php) chmod 777 $HOME_DIR/config.php $HOME_DIR/admin/config.php 
echo "Set $HOME_DIR/config.php, $HOME_DIR/admin/config.php to chmod 777 applied"

echo "END."