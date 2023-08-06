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
include $(ENV_FILE)

COMPOSE_FILE = srcs/docker-compose.yml
DOCKER = docker
COMPOSE = $(DOCKER) compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE)

all: build upd

dir:
	mkdir -p "/home/apigeon/$(DATA_DIR)/mariadb"
	mkdir -p "/home/apigeon/$(DATA_DIR)/wordpress"

upd:	dir $(ENV_FILE)
	$(COMPOSE) up -d

up:		dir $(ENV_FILE)
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

logs.%:
	$(COMPOSE) logs $*

exec.%:
	$(COMPOSE) exec -it $* /bin/bash

clean:
	$(COMPOSE) down -v

fclean: clean
	$(DOCKER) system prune -a --volumes -f
	sudo rm -rf "/home/apigeon/$(DATA_DIR)"

re: fclean all

.PHONY: all dir upd up stop down restart build clean ps re
