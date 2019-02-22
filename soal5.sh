#!/bin/bash

cat /var/log/syslog | awk 'tolower($0) ~ /cron/ && tolower($0) ~ !/sudo/ {print $0;}' | awk 'NF<13' > ~/Timo/modul1/syslog.sh

#cat /var/log/syslog | awk ' /cron/i && !/sudo/i {print}' | awk 'NF<13' > ~/Timo/modul1/syslog.sh
#cat /var/log/syslog | awk 'BEGIN {IGNORECASE=1} /cron/ && !/sudo/ {print $n}' | awk 'NF<13' > ~/Timo/modul1/syslog.sh
