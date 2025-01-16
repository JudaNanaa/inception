#!/bin/bash

BACKUP_DIR="/backup/$(date +'%Y-%m-%d_%H-%M-%S')"

mkdir -p "$BACKUP_DIR"

mysqldump -h $DB_HOST -u $MARIADB_USER -p$MARIADB_USER_PASSWORD $MARIADB_NAME > "$BACKUP_DIR/db_backup.sql"

tar -czf "$BACKUP_DIR/wp_backup.tar.gz" /var/www/html

find /backup/* -mtime +7 -exec rm -rf {} \;

echo "Backup terminé à $(date)"
