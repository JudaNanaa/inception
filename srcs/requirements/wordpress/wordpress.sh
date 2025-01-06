#!/bin/sh

sleep 5


echo "[========WP INSTALLATION STARTED========]"
if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
    echo "wp-config.php non trouvé. Initialisation de WordPress..."

    find "/var/www/html/wordpress/" -mindepth 1 -delete

    wp core download --allow-root

    wp core config \
        --dbhost="$MARIADB_HOST" \
        --dbname="$MARIADB_NAME" \
        --dbuser="$MARIADB_USER" \
        --dbpass="$MARIADB_USER_PASSWORD" \
        --allow-root

    wp core install \
        --url="$DOMAIN_NAME" \
        --title="$TITLE" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --allow-root

    wp user create \
        "$WP_USER" \
        "$WP_USER_EMAIL" \
        --user_pass="$WP_USER_PASSWORD" \
        --allow-root

    echo "WordPress initialisé avec succès."
else
    echo "wp-config.php trouve. Aucune action effectuée."
fi

sleep 5 

mkdir -p /run/php

exec php-fpm83 -F
