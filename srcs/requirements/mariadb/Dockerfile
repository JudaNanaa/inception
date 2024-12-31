FROM alpine:3.20

# LABEL = metadata of the image like a photo
LABEL version="1.0"
LABEL description="MariaDB Server"

RUN apk add --no-cache mariadb \
   && apk add mariadb-client \
   && mkdir -p /run/mysqld \
   && chown -R mysql:mysql /run/mysqld

COPY 50-server.cnf etc/mysql/mariadb.conf.d/50-server.cnf

COPY mariadb-init.sh /

RUN chmod +x mariadb-init.sh

EXPOSE 3306

CMD ["/bin/sh", "/mariadb-init.sh"]