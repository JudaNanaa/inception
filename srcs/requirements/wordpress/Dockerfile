FROM alpine:3.20

RUN apk update && apk add --no-cache \
    php \
    php-fpm \
    php-mysqli \
    php-phar \
    wget \
    tar \
    curl \
    mariadb-client \
    php-iconv \
    php-tokenizer

EXPOSE 9000

COPY wordpress.sh /scripts/

RUN chmod +x /scripts/wordpress.sh

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && mkdir -p /var/www/html/wordpress/ \
    && chmod -R 755 /var/www/html/wordpress/ \
    && adduser -u 82 -D -G www-data www-data \
    && chown -R www-data:www-data /var/www/html/wordpress

WORKDIR /var/www/html/wordpress/

COPY www.conf /etc/php83/php-fpm.d/www.conf

CMD ["/scripts/wordpress.sh"]