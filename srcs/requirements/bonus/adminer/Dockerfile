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
	wget

COPY  adminer.sh /scripts

CMD [ "/scripts/adminer.sh" ]