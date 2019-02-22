#!/bin/bash

awk -F, '$7 ~ 2012 && $1 == "United States" && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection") {arr[$6] += $10} END {for(i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv | sort -t',' -grk2,2 | awk -F, '{print $1}' | head -n3
