
CONTAINER_NAME = name

all : up

up :
	@if [ -z $$(docker images -q $(CONTAINER_NAME)) ]; then \
		echo The 42 container buildind is in progress; \
		docker compose build; \
		echo The 42 container buildind is finished; \
	fi
	@echo The container gonna be starting now
	@docker compose run --name $(CONTAINER_NAME) --remove-orphans container_42

clean :
	@echo The 42 container gonna be cleaned
	@docker rm -f $(CONTAINER_NAME)
	@docker volume rm container_42_volume_42

re : clean all

.PHONY : all up clean re