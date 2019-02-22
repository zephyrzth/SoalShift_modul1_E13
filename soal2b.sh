#!/bin/bash
awk -F',' '$1 == "United States" && $7 ~ 2012 {arr[$4] += $10} END {for(i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv | sort -t, -grk2,2 | awk -F, '{print $1}' | head -n3

