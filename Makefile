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

SRCDIR = ../../Projects/ft_printf/src/
LIBFTFOLDER = ../../Projects/libft/
LIBFT = libft.a
LIBDIR = ../../Projects/
SRC = $(wildcard $(SRCDIR)*.c)

all: ft_printf_test ft_printf_unit_test

ft_printf_test: ft_printf_test.c $(SRC) libft.a libft.h libftprintf.h
	$(CC) -w $(SRC) $< -L. -l:libft.a -o $@ -g

ft_printf_unit_test: ft_printf_unit_test.c $(SRC) libft.a libft.h libftprintf.h
	$(CC) -w $(SRC) $< -L. -l:libft.a -o $@ -g

libft.a: ~/Projects/libft/libft.a
	cp $< ./

libft.h: ~/Projects/libft/libft.h
	cp $< ./

libftprintf.h: ~/Projects/ft_printf/include/libftprintf.h
	cp $< ./

clean:

fclean: clean
	rm -f ./*_test

re: fclean all

.PHONY: clean fclean re all
