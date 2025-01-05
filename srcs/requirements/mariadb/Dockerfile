FROM debian:bullseye

RUN apt-get update && apt install -y mariadb-server vim zsh

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY tools/mariadb.sh /

RUN chmod +x mariadb.sh

EXPOSE 3306

ENTRYPOINT [ "/mariadb.sh", "mysqld" ]
