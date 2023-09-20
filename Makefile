all: 
	sudo mkdir -p /home/guribeir/data/pages
	docker-compose -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all

fclean: clean
	docker system prune --all --volumes --force
	docker network rm $(docker network ls --filter type=custom -q)
	sudo rm -rf /home/guribeir/data

re: fclean all

.PHONY: all clean fclean re
