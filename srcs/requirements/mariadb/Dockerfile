FROM alpine:3.20

# LABEL = metadata of the image like a photo
LABEL version="1.0"
LABEL description="MariaDB Server"

RUN apk update && \
    apk add --no-cache mariadb mariadb-client mariadb-server-utils

EXPOSE 3306

COPY ./start-mariadb.sh /start-mariadb.sh

RUN chmod +x /start-mariadb.sh && chmod 775 /var/lib/mysql

ENTRYPOINT ["/start-mariadb.sh"]