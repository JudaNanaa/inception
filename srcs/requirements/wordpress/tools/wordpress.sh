#!/bin/sh

sleep 5


echo "[========WP INSTALLATION STARTED========]"
if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
    echo "wp-config.php non trouvé. Initialisation de WordPress..."

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


    # for redis
    wp config set WP_REDIS_HOST $WP_REDIS_HOST --allow-root
    wp config set WP_REDIS_PORT $WP_REDIS_PORT --allow-root
    wp config set WP_CACHE true --add --allow-root

	# for fail2ban
    wp config set WP_DEBUG true --allow-root
    wp config set WP_DEBUG_LOG true --allow-root
    wp config set WP_DEBUG_DISPLAY false --add --allow-root

    wp plugin install redis-cache --activate
    wp redis enable --allow-root

	chmod -R 777 . && chown -R www-data:www-data .

    echo "WordPress initialisé avec succès."
else
    echo "wp-config.php trouve. Aucune action effectuée."
fi

sleep 5 

echo "The website is accessible."
exec php-fpm83 -F
