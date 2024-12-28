#!/bin/sh

# Initialiser la base de données si elle n'existe pas
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    # Démarrer MariaDB en mode sécurité temporaire
    mysqld_safe --skip-networking &
    sleep 5

    # Configurer les utilisateurs et les mots de passe
    mysql -u root <<-EOSQL
        ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
        CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
        CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
        GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
        FLUSH PRIVILEGES;
EOSQL

    # Arrêter MariaDB après initialisation
    pkill -f 'mysqld|mariadbd'
    sleep 1
fi

# Démarrer MariaDB en mode normal
exec mysqld_safe
