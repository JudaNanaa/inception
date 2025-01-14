#!/bin/sh

wget "http://www.adminer.org/latest.php" -O /var/www/html/wordpress/adminer/adminer.php
adduser -u 82 -D -G www-data www-data
chown -R www-data:www-data /var/www/html/wordpress/adminer/adminer.php
chmod 755 /var/www/html/wordpress/adminer/adminer.php

exec php-fpm83 -F