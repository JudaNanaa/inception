FROM debian:bullseye

RUN apt-get update && apt install -y mariadb-server vim zsh

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/

COPY mariadb.sh /scripts/

RUN chmod +x /scripts/mariadb.sh

EXPOSE 3306

ENTRYPOINT [ "/scripts/mariadb.sh" ]
