all : up 

up :
	mkdir -p ~/madamou/data/mariadb
	mkdir -p ~/madamou/data/wordpress
	docker compose -f srcs/docker-compose.yml up --build

down : 
	docker compose -f srcs/docker-compose.yml down

delete :
	sudo rm -rf ~/madamou/data/*

clean : delete
	docker container rm -f mariadb
	docker container rm -f wordpress
	docker container rm -f nginx
	docker system prune -af

log :
	docker compose -f srcs logs

re : clean all