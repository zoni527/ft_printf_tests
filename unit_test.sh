#!/bin/sh
./ft_printf_unit_test > temp1
./ft_printf_unit_test f > temp2
diff temp1 temp2 > temp3
if [ -s "$t3" ]; then
	echo "Difference in output:"
	cat t3
else
	echo "No difference in output"
fi
