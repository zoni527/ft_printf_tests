#!/bin/bash
./ft_printf_unit_test > temp1
./ft_printf_unit_test f > temp2
diff temp1 temp2 -a -u > temp3
if [ -s temp3 ]; then
	echo "Difference in output:"
	cat temp3
else
	echo "No difference in output"
fi
#rm -f temp[1-3]
