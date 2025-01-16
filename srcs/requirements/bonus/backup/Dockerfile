# Utilisation de l'image Alpine Linux comme base
FROM alpine:3.20

# Installe les outils nécessaires (mariadb-client, tar, cron, bash)
RUN apk update && apk add --no-cache mariadb-client tar bash curl

# Crée les dossiers pour stocker les scripts et sauvegardes
RUN mkdir -p /backup /scripts

# Copie les scripts de sauvegarde dans le container
COPY conf/backup.sh /scripts/backup.sh
COPY conf/crontab /etc/crontabs/root

# Donne les droits d'exécution au script
RUN chmod +x /scripts/backup.sh

# Définit le point d'entrée pour démarrer cron
CMD ["crond", "-f", "-l", "8"]