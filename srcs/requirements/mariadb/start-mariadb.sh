#!/bin/sh

# Function to validate the admin password
validate_admin_password() {
    if echo "${MYSQL_ROOT_PASSWORD}" | grep -qiE 'admin|administrator'; then
        echo "Error: Admin password cannot contain 'admin' or 'administrator'. Exiting."
        exit 1
    fi
}

# Function to initialize the database if it doesn't exist
initialize_database() {
    if [ ! -d "/var/lib/mysql/mysql" ]; then
        echo "Initializing database..."
        mysql_install_db --user=mysql --datadir=/var/lib/mysql
        mysqld_safe --skip-networking &
        sleep 5
    fi
}

# Function to create the root user, database, and other users
create_users() {
    echo "Setting up users and database..."
    mysql -u root <<-EOSQL
        ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
        CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
        CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
        GRANT ALL ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
        FLUSH PRIVILEGES;
EOSQL
    mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
    sleep 1
}

# Function to start the database service
start_database() {
    echo "Starting MariaDB server..."
    exec /usr/bin/mariadbd --user=mysql --datadir=/var/lib/mysql
}

# Main script execution
validate_admin_password
if [ ! -d "/var/lib/mysql/mysql" ]; then
    initialize_database
    create_users
fi

start_database
