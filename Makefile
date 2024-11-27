# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jvarila <jvarila@student.hive.fi>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/07 15:58:04 by jvarila           #+#    #+#              #
#    Updated: 2024/11/13 09:56:25 by jvarila          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc
CFLAGS = -Wall -Wextra -Werror

PROJECTDIR = ~/Repos/ft_printf/
SRCDIR = $(PROJECTDIR)src/
LIBFTDIR = ~/Repos/libft/
SRC = $(wildcard $(SRCDIR)*.c)

all: ft_printf_test ft_printf_unit_test

ft_printf_test: ft_printf_test.c $(SRC) libft.a libft.h libftprintf.h
	$(CC) -w $(SRC) $< -L. -l:libft.a -o $@ -g

ft_printf_unit_test: ft_printf_unit_test.c $(SRC) libft.a libft.h libftprintf.h
	$(CC) -w $(SRC) $< -L. -l:libft.a -o $@ -g

libft.a: $(LIBFTDIR)libft.a
	cp $< ./

libft.h: $(LIBFTDIR)libft.h
	cp $< ./

libftprintf.h: $(PROJECTDIR)/include/libftprintf.h
	cp $< ./

clean:

fclean: clean
	rm -f ./*_test *temp* *_output

re: fclean all

.PHONY: clean fclean re all
