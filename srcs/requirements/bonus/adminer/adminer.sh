#!/bin/sh

mkdir -p /var/www/html/
wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php
adduser -u 82 -D -G www-data www-data
chown -R www-data:www-data /var/www/html/adminer.php
chmod 755 /var/www/html/adminer.php

cd /var/www/html

rm -rf index.html

php -S 0.0.0.0:80