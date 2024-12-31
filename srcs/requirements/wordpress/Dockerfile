FROM alpine:3.20

# Install necessary dependencies
RUN apk update && apk add --no-cache \
    php \
    php-fpm \
    php-mysqli \
    php-json \
    php-openssl \
    php-curl \
    php-zlib \
    php-xml \
    php-phar \
    php-intl \
    php-mbstring \
    php-gd \
    php-ctype \
    php-dom \
    php-fileinfo \
    php-session \
    php-tokenizer \
    php-opcache \
    wget \
    tar \
    curl \
    mysql-client

WORKDIR /var/www/html

# Download and extract WordPress
RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz \
    && tar -xzf wordpress.tar.gz --strip-components=1 \
    && rm wordpress.tar.gz

COPY ./wp-config.php .

EXPOSE 9000

CMD ["php-fpm83", "-F"]

#  regarder commment fonctionne wp-cli 