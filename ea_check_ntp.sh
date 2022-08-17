#!/bin/bash

#################################################################################
# 
# ea_check_ntp.sh
# 
# Extension attribute that returns the Network Time Server
# that the macOS device is using.
# 
# Created by Bryce McKenney
# 
#################################################################################

if [[ $(/usr/sbin/systemsetup -getusingnetworktime) =~ "On" ]]; then
    echo "<result>$(/usr/sbin/systemsetup -getnetworktimeserver | sed -e "s/Network Time Server: //g")</result>"
else
    echo "<result>Network time is off.</result>"
fi