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

CC			:= cc
CFLAGS		:= -Wall -Wextra -Werror
# ---------------------------------------------------------------------------- #
PROJECT_DIR	:= /home/jvarila/Repos/ft_printf
HEADER_DIR	:= $(PROJECT_DIR)/include
LIBFT_DIR	:= $(PROJECT_DIR)/libft
# ---------------------------------------------------------------------------- #
HEADER		:= $(HEADER_DIR)/libftprintf.h
LIB			:= $(PROJECT_DIR)/libftprintf.a
LIBFT_H		:= $(LIBFT_DIR)/libft.h
# ---------------------------------------------------------------------------- #
SRC			:= $(wildcard ./*.c)
TESTS		:= $(SRC:.c=)
# ---------------------------------------------------------------------------- #

all: $(TESTS)

$(TESTS): %: %.c $(LIB) $(HEADER) $(LIBFT_H)
	$(CC) $(CFLAGS) -w -I $(HEADER_DIR) -I $(LIBFT_DIR) $< $(LIB) -o $@

$(LIB):
	make -C $(PROJECT_DIR)

clean:
	rm -f *temp* *_output

fclean: clean
	rm -f ./*_test

re: fclean all

# ---------------------------------------------------------------------------- #
.PHONY: clean fclean re all
# ---------------------------------------------------------------------------- #
