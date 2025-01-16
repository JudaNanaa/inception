#!/bin/bash

# Variables
BACKUP_DIR="/backup/$(date +'%Y-%m-%d_%H-%M-%S')"
DB_HOST="mariadb" # Nom du container MariaDB

# Crée le dossier de backup
mkdir -p "$BACKUP_DIR"

# Sauvegarde de la base de données
mysqldump -h $DB_HOST -u $MARIADB_USER -p$MARIADB_USER_PASSWORD $MARIADB_NAME > "$BACKUP_DIR/db_backup.sql"

# Sauvegarde des fichiers WordPress (volume partagé)
tar -czf "$BACKUP_DIR/wp_backup.tar.gz" /var/www/html

# (Optionnel) Supprime les backups de plus de 7 jours
find /backup/* -mtime +7 -exec rm -rf {} \;

echo "Backup terminé à $(date)"
