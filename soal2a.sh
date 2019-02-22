#!/bin/bash
#sort -t',' -gk10,10 WA_Sales_Products_2012-14.csv | awk -F',' '/2012/ {print $1}' | tail -n1

awk -F, '$7 ~ 2012 {arr[$1] += $10} END { for(i in arr) print i "," arr[i] }' WA_Sales_Products_2012-14.csv | sort -t',' -gk2,2 | awk -F',' '{print $1}' | tail -n1
