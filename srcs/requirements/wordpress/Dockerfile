FROM alpine:3.20

# Install necessary dependencies
RUN apk update && apk add --no-cache \
    php \
    php-fpm \
    php-mysqli \
    php-phar \
    wget \
    tar \
    curl \
    mariadb-client \
    php-iconv

EXPOSE 9000

COPY wordpress.sh /

RUN chmod +x wordpress.sh

COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf

CMD ["/wordpress.sh"]

#  regarder commment fonctionne wp-cli 