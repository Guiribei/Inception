FROM alpine:3.17

RUN apk update && apk add --no-cache mysql-client php-fpm php81 \
			php81-phar php81-common php81-session php81-iconv php81-json \
			php81-gd php81-curl php81-xml php81-mysqli php81-imap php81-cgi \
			fcgi php81-pdo php81-pdo_mysql php81-soap php81-posix php81-tokenizer \
			php81-gettext php81-ldap php81-ctype php81-dom php81-simplexml curl

ARG DATABASE_NAME
ARG DATABASE_USER
ARG DATABASE_USER_PASSWORD
ARG WP_ADMIN_USER
ARG WP_ADMIN_PASSWD
ARG WP_ADMIN_EMAIL
ARG WP_USER
ARG WP_USER_PASSWD
ARG WP_USER_EMAIL
ARG WP_URL
ARG WP_DB_HOST
ARG WP_TITLE

COPY tools/wp_entrypoint.sh /usr/local/bin/

RUN echo "listen = 0.0.0.0:9000" >> /etc/php81/php-fpm.d/www.conf

RUN chmod +x /usr/local/bin/wp_entrypoint.sh

WORKDIR /var/www/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && wp core download --allow-root

RUN wp cli update --allow-root

EXPOSE 9000

CMD ["ash", "-f", "/usr/local/bin/wp_entrypoint.sh"]
