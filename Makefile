# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: apigeon <apigeon@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/18 17:18:14 by apigeon           #+#    #+#              #
#    Updated: 2022/11/18 17:18:23 by apigeon          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ENV_FILE = srcs/.env
COMPOSE_FILE = srcs/docker-compose.yml
DOCKER = docker
COMPOSE = $(DOCKER) compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE)

all: dir build upd

dir:
	mkdir -p "/home/$(USER)/data/mariadb"
	mkdir -p "/home/$(USER)/data/wordpress"

upd:	$(ENV_FILE)
	$(COMPOSE) up -d

up:		$(ENV_FILE)
	$(COMPOSE) up

start:
	$(COMPOSE) start

stop:
	$(COMPOSE) stop

down:
	$(COMPOSE) down

restart:	$(ENV_FILE)
	$(COMPOSE) restart

build:
	$(COMPOSE) build

ps:
	$(COMPOSE) ps

logs:
	$(COMPOSE) logs

clean:
	$(COMPOSE) down -v

fclean: clean
	sudo rm -rf /home/$(USER)/data
	$(DOCKER) image ls -a -q | xargs $(DOCKER) image rm

re: fclean all

.PHONY: all dir upd up stop down restart build clean ps re
