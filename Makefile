all : 
	docker compose -f srcs/docker-compose.yml up

up : all

down : 
	docker compose -f srcs/docker-compose.yml down

clean :
	(docker stop $(docker ps -a -q) ; docker rm $(docker ps -a -q) ; docker rmi $(docker images -a -q) ; docker volume prune -f ; docker container prune -f ; docker system prune --all --force --volumes; docker volume rm -f $(docker volume ls | grep -v DRIVER | tr -s " " | cut -d " "  -f 2 | tr "\n" " "))2>>/dev/null