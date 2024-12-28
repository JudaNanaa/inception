FROM alpine:3.20

WORKDIR /app

RUN apk update && \
    apk add mariadb && \
    apk add mariadb-client

    
# LABEL = metadata of the image like a photo
LABEL version="1.0"
LABEL description="MariaDB Server"

EXPOSE 3306

# HEALTHCHECK = check if the container is healty : 
    # - try simple cmd and look if it's work
HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

# RUN /etc/init.d/mariadb setup

# RUN rc-service mariadb start

ENTRYPOINT [ "mariadbd" ]