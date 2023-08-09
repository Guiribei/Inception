#https://medium.com/@macdonaldchika/how-to-install-tls-ssl-on-docker-nginx-container-with-lets-encrypt-5bd3bad1fd48

FROM alpine:3.17

RUN apk update && apk add --no-cache nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx"]

CMD ["-g", "daemon off;"]