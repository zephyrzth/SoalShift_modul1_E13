#!/bin/bash
read x
#echo $x

for ((i=1;i<=x;i++))
do
	if [ -f ~/Timo/Sisop/"password$i.txt" ]
		then 
			x=$x+1
	else
		`< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c12 &>> "password$i.txt"`
	fi
done

echo "Password baru telah dibuat"

