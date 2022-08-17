#!/bin/bash

#################################################################################
# 
# set_ntp_to_google.sh
# 
# Ensures that Network-based time (rather than locally-set time) is
# enabled, and that the Time Server (NTP) is set to time.google.com.
# 
# Created by Bryce McKenney
# 
#################################################################################

if [[ $(/usr/sbin/systemsetup -getusingnetworktime) =~ "Off" ]]; then
    /usr/sbin/systemsetup -setusingnetworktime On
fi
/usr/sbin/systemsetup -setnetworktimeserver time.google.com