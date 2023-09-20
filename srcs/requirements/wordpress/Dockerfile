FROM alpine:3.17

RUN apk update && apk add --no-cache \
    php81 \
    php81-fpm \
    php81-opcache \
    php81-gd \
    php81-mysqli \
    php81-zlib \
    php81-curl \
    php81-mbstring \
    php81-json \
    php81-xml \
    php81-xmlreader \
    php81-soap \
    php81-tokenizer \
    php81-intl \
    php81-fileinfo \
    php81-phar \
    curl


COPY conf/www.conf /etc/php8/php-fpm.d/

WORKDIR /var/www/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN wp cli update --allow-root

# RUN chown -R ${PHP_FPM_USER}:${PHP_FPM_GROUP} /var/www/wordpress

# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#     && chmod +x wp-cli.phar \
#     && mv wp-cli.phar /usr/local/bin/wp

# RUN cd /var/www/wordpress && \
#     wp core download && \
#     wp config create --dbname=wordpress --dbuser=root --dbpass=root --dbhost=mariadb && \
#     wp core install --url=your_domain.com --title="My WordPress Site" --admin_user=admin --admin_password=admin --admin_email=admin@example.com


CMD ["php-fpm81", "-F"]
