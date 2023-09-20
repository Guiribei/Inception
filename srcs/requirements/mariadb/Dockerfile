FROM alpine:3.17

ARG DATABASE_USER
ARG DATABASE_USER_PASSWORD
ARG DATABASE_NAME
ARG DATABASE_ROOT_PASSWORD

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY ./conf/my.cnf /etc/mysql/my.cnf

COPY ./tools/mariadb.sh /usr/local/bin

RUN chmod +x /usr/local/bin/mariadb.sh && ash -f /usr/local/bin/mariadb.sh

EXPOSE 3306

CMD ["mariadb-safe"]