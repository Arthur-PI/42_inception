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

COMPOSE = docker compose -f srcs/docker-compose.yml

start:	build
	$(COMPOSE) up -d

stop:
	$(COMPOSE) stop

down:
	$(COMPOSE) down

restart:
	$(COMPOSE) restart

build:
	$(COMPOSE) build

clean: down
	$(COMPOSE) rm

.PHONY: start stop restart build clean
