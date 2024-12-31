FROM alpine:3.20

# LABEL = metadata of the image like a photo
LABEL version="1.0"
LABEL description="MariaDB Server"

RUN apk add --no-cache mariadb \
   && apk add mariadb-client \
   && apk add bash \
   && apk add openrc \
   && mkdir -p /run/mysqld \
   && chown -R mysql:mysql /run/mysqld

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/

# EXPOSE 3306

COPY ./start-mariadb.sh /

RUN chmod +x /start-mariadb.sh && chmod 775 /var/lib/mysql

ENTRYPOINT [ "tail", "-f" ]

# ENTRYPOINT ["/start-mariadb.sh"]