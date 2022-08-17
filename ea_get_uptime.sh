#!/bin/bash

#################################################################################
# 
# ea_get_uptime.sh
# 
# Returns a formatted uptime as an extension attribute.
# 
# Created by Bryce McKenney
# 
#################################################################################

boottime=`sysctl -n kern.boottime | awk '{print $4}' | sed 's/,//g'`
unixtime=`date +%s`
timeAgo=$(($unixtime - $boottime))
uptime=`awk -v time=$timeAgo 'BEGIN { seconds = time % 60; minutes = int(time / 60 % 60); hours = int(time / 60 / 60 % 24); days = int(time / 60 / 60 / 24); printf("%02d:%02d:%02d:%02d", days, hours, minutes, seconds); exit }'`

echo "<result>$uptime</result>"