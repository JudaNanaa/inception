FROM alpine:3.20

RUN apk update && apk add --no-cache \
    php \
    php-apache2 \
    php-mysqli \
    php-session \
    php-json \
    php-zlib \
    php-ctype \
    php-mbstring \
	wget \
    bash

COPY adminer.sh /scripts/

RUN chmod +x /scripts/adminer.sh


CMD ["/scripts/adminer.sh"]