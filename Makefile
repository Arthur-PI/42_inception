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
COMPOSE = docker compose -f srcs/docker-compose.yml --env-file $(ENV_FILE)

start:	build $(ENV_FILE)
	$(COMPOSE) up -d

stop:
	$(COMPOSE) stop

down:
	$(COMPOSE) down

restart: $(ENV_FILE)
	$(COMPOSE) restart

build:
	$(COMPOSE) build

clean: down
	$(COMPOSE) stop
	docker prune --all --volumes

re: clean start

.PHONY: start stop restart build clean
