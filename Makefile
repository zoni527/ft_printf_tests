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
LIB = libftprintf.a
PROJECTDIR = ~/Repos/ft_printf/
LIBFTDIR = ~/Repos/ft_printf/libft/
SRC = $(wildcard ./*.c)
TSTS = $(SRC:.c=)

all: $(TSTS) $(LIB)

$(TSTS): %:%.c $(LIB)
	$(CC) $(CFLAGS) -w $@.c -L. -l:$(LIB) -o $@

$(LIB): $(PROJECTDIR)$(LIB)
	cp $< ./

#libft.h: $(LIBFTDIR)libft.h
#	cp $< ./
#
#libftprintf.h: $(PROJECTDIR)/include/libftprintf.h
#	cp $< ./

clean:

fclean: clean
	rm -f ./*_test *temp* *_output

re: fclean all

.PHONY: clean fclean re all
