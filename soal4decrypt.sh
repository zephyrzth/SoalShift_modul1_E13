
#!/bin/bash

#echo "Sebutkan alamat dan nama file yang didecrypt"
#read name

#jamjudul=`awk -v var="$name" 'BEGIN{print var}' | awk -F':' '{print $1}'  | tail -c3`
jam=`date +%H`
menit=`date +%M`
tanggal=`date +%d`
bulan=`date +%m`
tahun=`date +%Y`
filename="$jam:$menit $tanggal-$bulan-$tahun"

for i in /var/log/backup/*
do
	judul1=`printf "${i##*/}" | awk '{print $1}'`
	judul2=`printf "${i##*/}" | awk '{print $2}'`
	judul=$judul1"_"$judul2
	sudo mv /var/log/backup/* /var/log/backup/$judul
	#jamjudul=`echo $i | awk -F"/" '{print $8}' | awk -F":" '{print $1}'`
	#echo $jamjudul
	jamjudul=`echo $judul1 | awk -F":" '{print $1}'`
done

cipher1lower=`expr $jamjudul + 97`
cipher2lower=`expr $jamjudul + 97 - 1`

cipher1upper=`expr $jamjudul + 65`
cipher2upper=`expr $jamjudul + 65 - 1`

charcipher1lower="\\$(printf '%03o' $cipher1lower)"
charcipher2lower="\\$(printf '%03o' $cipher2lower)"

charcipher1upper="\\$(printf '%03o' $cipher1upper)"
charcipher2upper="\\$(printf '%03o' $cipher2upper)"

patternlower=$charcipher1lower"-za-"$charcipher2lower
patternupper=$charcipher1upper"-ZA-"$charcipher2upper

for i in /var/log/backup/*
do
	cat $i | tr [$patternupper$patternlower] [A-Za-z] > /var/log/backup/"$filename"
	rm /var/log/backup/$judul
done

#var=`cat /var/log/backup/syslog`
#cat $name | tr [$patternupper$patternlower] [A-Za-z] > "$filename"

