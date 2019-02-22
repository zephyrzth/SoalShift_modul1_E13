#!/bin/bash

gambar=`ls | grep "[.]jpg$"`

for i in $gambar
do
	base64 -d $i | xxd -r > "jadi$i.jpg"
done
