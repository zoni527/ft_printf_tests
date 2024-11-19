/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf_test.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jvarila <jvarila@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/13 13:28:28 by jvarila           #+#    #+#             */
/*   Updated: 2024/11/18 19:46:37 by jvarila          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libftprintf.h"
#include <stdio.h>
#define OUTPUT_FORMAT "\n%20s%20s\n%20s%20s\n%20s%20d\n%20s%20d\n"

int	main(int argc, char **argv)
{
	(void)argc;
	(void)argv;
	char			c;
	char			*s;
	void			*p;
	int				d;
	int				i;
	unsigned int	u;
	unsigned int	x;
	unsigned		X;
	char			*format_str;
	char			percentage;
	int				rval;
	int				ft_rval;
	char			*itoa;

	c = '\0';
	s = NULL;
	p = "test";
	d = INT_MAX;
	i = INT_MIN;
	u = UINT_MAX;
	x = 42 * 42;
	X = 42 * 42;
	percentage = '%';

	rval = printf(&c);
	printf("\n");
	ft_rval = ft_printf(&c);
	printf("\n");
	printf(OUTPUT_FORMAT, "format string:", "none", "input:", "\\0", 
		"rval:", rval, "ft_rval:", ft_rval);
	printf("\n");

	rval = printf(s);
	printf("\n");
	ft_rval = ft_printf(s);
	printf("\n");
	printf(OUTPUT_FORMAT, "format string:", "none", "input:", s, 
		"rval:", rval, "ft_rval:", ft_rval);
	printf("\n");

	format_str = "%p";
	rval = printf(format_str, p);
	printf("\n");
	ft_rval = ft_printf(format_str, p);
	printf("\n");
	printf(OUTPUT_FORMAT, "format string:", format_str, "input:", p, 
		"rval:", rval, "ft_rval:", ft_rval);
	printf("\n");

	format_str = "%d";
	itoa = ft_itoa(d);
	rval = printf(format_str, d);
	printf("\n");
	ft_rval = ft_printf(format_str, d);
	printf("\n");
	printf(OUTPUT_FORMAT, "format string:", format_str, "input:", itoa, 
		"rval:", rval, "ft_rval:", ft_rval);
	printf("\n");
	free(itoa);

	format_str = "%i";
	itoa = ft_itoa(i);
	rval = printf(format_str, i);
	printf("\n");
	ft_rval = ft_printf(format_str, i);
	printf("\n");
	printf(OUTPUT_FORMAT, "format string:", format_str, "input:", itoa, 
		"rval:", rval, "ft_rval:", ft_rval);
	printf("\n");
	free(itoa);

	format_str = "%u";
	itoa = ft_itoa(u);
	rval = printf(format_str, u);
	printf("\n");
	ft_rval = ft_printf(format_str, u);
	printf("\n");
	printf(OUTPUT_FORMAT, "format string:", format_str, "input:", itoa, 
		"rval:", rval, "ft_rval:", ft_rval);
	printf("\n");
	free(itoa);

	format_str = "%x";
	itoa = ft_itoa(x);
	rval = printf(format_str, x);
	printf("\n");
	ft_rval = ft_printf(format_str, x);
	printf("\n");
	printf(OUTPUT_FORMAT, "format string:", format_str, "input:", itoa, 
		"rval:", rval, "ft_rval:", ft_rval);
	printf("\n");
	free(itoa);

	format_str = "%X";
	itoa = ft_itoa(X);
	rval = printf(format_str, X);
	printf("\n");
	ft_rval = ft_printf(format_str, X);
	printf("\n");
	printf(OUTPUT_FORMAT, "format string:", format_str, "input:", itoa, 
		"rval:", rval, "ft_rval:", ft_rval);
	printf("\n");
	free(itoa);

	s = "test_person";
	format_str = "Hello %s, here is a char %c, here is a ";
	itoa = ft_itoa(X);
	rval = printf(format_str, X);
	printf("\n");
	ft_rval = ft_printf(format_str, X);
	printf("\n");
	printf(OUTPUT_FORMAT, "format string:", format_str, "input:", itoa, 
		"rval:", rval, "ft_rval:", ft_rval);
	printf("\n");
	free(itoa);

	return(0);

	// printf("%d%d%d", 1, 2, 3);
	// printf("\n");
	// printf("%d%d", 1, 2, 3);
	// printf("\n");
	// printf("%d%d%d%d", 1, 2, 3);

	return (0);
}
