#!/bin/bash

#arr=({a..z})
#echo ${arr[25]}

#alpha=$( printf "%s" {a..z} )
#part1=$( printf $(printf '\%03o' $(seq $((97+$1)) 122 ) ) )
#part2=$( printf $(printf '\%03o' $(seq 97 $((97+$1-1)) ) ) )
#sed -i y/$alpha/$part1$part2/ test.txt
#echo $part1


#printf "\\$(printf '%03o' 65)"

#############################################################

jam=`date +%H`
menit=`date +%M`
tanggal=`date +%d`
bulan=`date +%m`
tahun=`date +%Y`
filename="$jam:$menit $tanggal-$bulan-$tahun"

cipher1lower=`expr $jam + 97`
cipher2lower=`expr $jam + 97 - 1`

cipher1upper=`expr $jam + 65`
cipher2upper=`expr $jam + 65 - 1`

charcipher1lower="\\$(printf '%03o' $cipher1lower)"
charcipher2lower="\\$(printf '%03o' $cipher2lower)"

charcipher1upper="\\$(printf '%03o' $cipher1upper)"
charcipher2upper="\\$(printf '%03o' $cipher2upper)"

patternlower=$charcipher1lower"-za-"$charcipher2lower
patternupper=$charcipher1upper"-ZA-"$charcipher2upper

cat /var/log/syslog | tr [A-Za-z] [$patternupper$patternlower] > "/var/log/backup/$filename"
#cat ~/Sistem_Operasi/Modul_1/Soal_Shift/coba.txt | tr [A-Za-z] [$patternupper$patternlower] > "/home/anargya/Sistem_Operasi/Modul_1/Soal_Shift/decrypt4/$filename"
