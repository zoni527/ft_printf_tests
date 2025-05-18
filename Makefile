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
FT_PRINTF_DIR = ..
LIB_H_DIR = $(FT_PRINTF_DIR)/include
LIBFT_DIR = $(FT_PRINTF_DIR)/libft
SRC = $(wildcard ./*.c)
TESTS = $(SRC:.c=)

all: $(TESTS)

$(TESTS): %: %.c libftprintf.a libftprintf.h libft.h
	$(CC) $(CFLAGS) -w $< libftprintf.a -o $@

libftprintf.a: $(FT_PRINTF_DIR)/libftprintf.a
	cp $< ./

libft.h: $(LIBFT_DIR)/libft.h
	cp $< ./

libftprintf.h: $(LIB_H_DIR)/libftprintf.h
	cp $< ./

clean:
	rm -f libftprintf.a libftprintf.h libft.h *temp* *_output

fclean: clean
	rm -f ./*_test

re: fclean all

.PHONY: clean fclean re all
