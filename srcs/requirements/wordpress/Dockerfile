FROM alpine:3.17

RUN apk add --no-cache \
    php8 \
    php8-fpm \
    php8-opcache \
    php8-gd \
    php8-mysqli \
    php8-zlib \
    php8-curl \
    php8-mbstring \
    php8-json \
    php8-xml \
    php8-xmlreader \
    php8-xmlrpc \
    php8-soap \
    php8-tokenizer \
    php8-pecl-mcrypt \
    php8-intl \
    php8-fileinfo \
    wget \
    curl

ENV PHP_FPM_USER="www" \
    PHP_FPM_GROUP="www" \
    PHP_FPM_LISTEN_MODE="0660" \
    PHP_MEMORY_LIMIT="512M" \
    PHP_MAX_UPLOAD="50M" \
    PHP_MAX_FILE_UPLOAD="200" \
    PHP_MAX_POST="100M" \
    PHP_MAX_EXECUTION_TIME="360"

COPY config/www.conf /etc/php8/php-fpm.d/

RUN wget https://wordpress.org/latest.tar.gz -O - | tar xz -C /var/www/

RUN chown -R ${PHP_FPM_USER}:${PHP_FPM_GROUP} /var/www/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN cd /var/www/wordpress && \
    wp core download && \
    wp config create --dbname=wordpress --dbuser=root --dbpass=root --dbhost=mariadb && \
    wp core install --url=your_domain.com --title="My WordPress Site" --admin_user=admin --admin_password=admin --admin_email=admin@example.com

EXPOSE 9000

CMD ["php-fpm8", "-F"]
