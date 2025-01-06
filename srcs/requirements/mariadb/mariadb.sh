#!/bin/sh

service mariadb start
 
sleep 5

echo "FLUSH PRIVILEGES;" | mysql
echo "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD';" | mysql

echo "GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD';"  | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';"  | mysql
echo "FLUSH PRIVILEGES;" | mysql

echo "CREATE DATABASE $MARIADB_NAME;" | mysql

kill $(cat /var/run/mysqld/mysqld.pid)

exec mysqld
