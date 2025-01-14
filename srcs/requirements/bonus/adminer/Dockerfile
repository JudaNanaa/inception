FROM alpine:3.20

RUN apk update && apk add --no-cache \
    php \
    php-fpm \
    php-apache2 \
    php-mysqli \
    php-session \
    php-json \
    php-zlib \
    php-ctype \
    php-mbstring \
	wget \
    bash

RUN	mkdir -p /run/php

COPY adminer.sh /scripts/

RUN chmod +x /scripts/adminer.sh

RUN mkdir -p /var/www/html/wordpress/adminer

WORKDIR /var/www/html/wordpress/adminer

COPY www.conf /etc/php83/php-fpm.d/www.conf

EXPOSE 7000

CMD ["/scripts/adminer.sh"]