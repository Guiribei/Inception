
all: confs up

confs:
	@ sudo mkdir -p /home/guribeir/data/db_data
	@ sudo mkdir -p /home/guribeir/data/wp_data
	@ sudo grep "guribeir.42.fr" /etc/hosts || sudo sh -c 'echo "127.0.0.1 guribeir.42.fr" >> /etc/hosts'

up:
	docker-compose -f srcs/docker-compose.yml up --build -d

build-nginx: confs
	docker-compose -f srcs/docker-compose.yml up -d --build --force-recreate nginx

start-nginx: confs
	docker-compose -f srcs/docker-compose.yml up -d nginx

stop-nginx:
	docker-compose -f srcs/docker-compose.yml down nginx

build-mariadb: confs
	docker-compose -f srcs/docker-compose.yml up -d --build --force-recreate mariadb

start-mariadb: confs
	docker-compose -f srcs/docker-compose.yml up -d mariadb

stop-mariadb:
	docker-compose -f srcs/docker-compose.yml down mariadb

build-wordpress: confs
	docker-compose -f srcs/docker-compose.yml up -d --build --force-recreate wordpress

start-wordpress: confs
	docker-compose -f srcs/docker-compose.yml up -d wordpress

stop-wordpress:
	docker-compose -f srcs/docker-compose.yml down wordpress

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all

fclean: clean
	docker system prune --all --volumes --force
	# docker stop $(docker ps -aq)
	# docker rm --force $(docker ps -aq)
	# docker rmi --force $(docker image ls -q)
	# docker network rm $(docker network ls --filter type=custom -q)
	# docker volume rm $(docker volume ls -q)
	sudo rm -rf /home/guribeir/data

re: fclean all

.PHONY: all clean fclean re confs
