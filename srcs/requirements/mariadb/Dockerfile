FROM alpine:3.17

RUN apk update && apk add --no-cache mariadb mariadb-client

RUN install -d -m 777 /run/mysqld && \
    mysql_install_db --user=root && \
    mysqld --skip-networking --user=root & \
    sleep 10 && \
    mysqladmin -u root password $MYSQL_ROOT_PASSWORD && \
    mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $MYSQL_DATABASE;" && \
    mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

EXPOSE 3306

CMD ["mysqld"]