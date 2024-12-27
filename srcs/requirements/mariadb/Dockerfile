FROM alpine:3.20

WORKDIR /app

RUN apk update && \
    apk add mariadb && \
    apk add mariadb-client

# RUN /etc/init.d/mariadb setup

# RUN rc-service mariadb start

EXPOSE 3306