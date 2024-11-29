/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf_unit_test.c                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jvarila <jvarila@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/13 13:28:28 by jvarila           #+#    #+#             */
/*   Updated: 2024/11/19 14:55:32 by jvarila          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libftprintf.h"
#include <stdio.h>

int	(*f)(const char *format, ...);

int	main(int argc, char **argv)
{
	if (argc != 1)
		f = ft_printf;
	else
		f = printf;

	int rval;

	long long arri[]
		=	{0,	
			+1,	+2,	+3,	+4,	+5,	+6,	+7,	+8,	+9,	+10
			-1,	-2,	-3,	-4,	-5,	-6,	-7,	-8,	-9,	-10,
			+11, +21, +32, +43, +54, +65, +76, +87, +98,
			-11, -21, -32, -43, -54, -65, -76, -87, -98,
			+123,	+234,	+345,	+456,	+567,	+678,
			-123,	-234,	-345,	-456,	-567,	-678,
			+0x01,	+0x01010101,	+0x10101010,	+0xfff,
			-0x01,	-0x01010101,	-0x10101010,	-0xfff,
			INT_MAX,	INT_MIN,	UINT_MAX,	LONG_MAX,	LONG_MIN,
			42};
		
	int	arrc[]
		=	{0,	
			'a',	'b',	'c',	'x',	'y',	'z',	'0',	'9',
			'A',	'B',	'C',	'X',	'Y',	'Z',	'!',	'~',
			' ',	'\t',	'\n',	'%',	'#',	'@',	'$',	'*',
			'\\',	'\'',	'\"',	'^',	',',	'.',	';',	':',
			+126,	+127,	+128,	+129,	+254,	+255,	+256,	+300,
			-126,	-127,	-128,	-129,	-254,	-255,	-256,	-300,
			42};

	char	*arrs[]
		=	{NULL,	"",
			"abcdefghijklmnopqrstuvxyz",
			"ABCDEFGHIJKLMNOPQRSTUVXYZ",
			"0123456789",
			"~!@#$%^&*()+%",
			"a quick brown fox jumps over the lazy dog",
			"A QUICK BROWN FOX JUMPS OVER THE LAZY DOG"};

	for (int i = 0; i < sizeof(arri)/sizeof(arri[0]); i++)
	{
		f("---------------- input: %d\n", (int)arri[i]);
		rval = f("%i\n", arri[i]);
		f("%d\n", rval);
		rval = f("%d\n", arri[i]);
		f("%d\n", rval);
		rval = f("%u\n", arri[i]);
		f("%d\n", rval);
		rval = f("%x\n", arri[i]);
		f("%d\n", rval);
		rval = f("%X\n", arri[i]);
		f("%d\n", rval);
	}

	for (int i = 0; i < sizeof(arrc)/sizeof(arrc[0]); i++)
	{
		f("---------------- input: %c\n", arrc[i]);
		rval = f("%c\n", arrc[i]);
		f("%d\n", rval);
	}

	for (int i = 0; i < sizeof(arrs)/sizeof(arrs[0]); i++)
	{
		f("---------------- input: %s\n", arrs[i]);
		f("---------------- result with format string \"%%s\"\n");
		rval = f("%s\n", arrs[i]);
		f("%d\n", rval);
		f("---------------- result without format string\n");
		rval = f(arrs[i]);
		f("%d\n", rval);
	}

	return (0);
}
