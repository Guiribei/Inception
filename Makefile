all: 
	sudo mkdir -p /home/guribeir/data/pages
	docker-compose -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all

fclean: clean
	docker stop $(docker ps -aq)
	docker system prune --all --volumes --force
	# docker rm --force $(docker ps -aq)
	# docker rmi --force $(docker image ls -q)
	# docker network rm $(docker network ls --filter type=custom -q)
	docker volume rm $(docker volume ls -q)
	sudo rm -rf /home/guribeir/data

re: fclean all

.PHONY: all clean fclean re
