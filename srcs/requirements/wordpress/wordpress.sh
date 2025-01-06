#!/bin/sh

#!/bin/bash

sleep 5

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir /var/www/html/wordpress/

cd /var/www/html/wordpress/
chmod -R 755 /var/www/html/wordpress/
adduser -u 82 -D -G www-data www-data
chown -R www-data:www-data /var/www/html/wordpress


echo "[========WP INSTALLATION STARTED========]"

#!/bin/sh

# Chemin vers WordPress
WORDPRESS_PATH="/var/www/html/wordpress"

# Vérifie si le fichier wp-config-sample.php existe
if [ ! -f "$WORDPRESS_PATH/wp-config.php" ]; then
    echo "wp-config.php non trouvé. Initialisation de WordPress..."

    # Supprime tous les fichiers existants dans le répertoire WordPress
    find "$WORDPRESS_PATH/" -mindepth 1 -delete

    # Télécharge le core WordPress
    wp core download --allow-root

    # Configure WordPress avec les informations de la base de données
    wp core config \
        --dbhost="mariadb:3306" \
        --dbname="$MARIADB_NAME" \
        --dbuser="$MARIADB_USER" \
        --dbpass="$MARIADB_USER_PASSWORD" \
        --allow-root

    # Installe WordPress avec les informations fournies
    wp core install \
        --url="$DOMAIN_NAME" \
        --title="$TITLE" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --allow-root

    # Crée un utilisateur WordPress supplémentaire
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
