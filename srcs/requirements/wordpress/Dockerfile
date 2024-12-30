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

# Create the directory for WordPress
RUN mkdir -p /var/www/html/wordpress

# Download and extract WordPress
RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz -C /var/www/html/wordpress --strip-components=1 && \
    rm -rf wordpress.tar.gz

RUN mkdir -p /var/log/php83 && chown -R nobody:nobody /var/log/php83

# Configure php-fpm1
RUN mkdir -p /run/php && \
    sed -i 's/;daemonize = yes/daemonize = no/' /etc/php83/php-fpm.conf && \
    sed -i 's/listen = 127.0.0.1:9000/listen = 9000/' /etc/php83/php-fpm.d/www.conf

# Set permissions for WordPress
RUN chown -R nobody:nobody /var/www/html/wordpress

RUN chmod -R 775 /var/www/html/wordpress

# # Switch to a non-root user
# USER nobody

EXPOSE 9000

CMD ["php-fpm83", "-F"]


#  regarder commment fonctionne wp-cli 