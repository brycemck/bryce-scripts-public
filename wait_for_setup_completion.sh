#!/bin/bash

#################################################################################
# 
# wait_for_setup_completion.sh
# 
# Loops until dock is active and logged in user isn't `root` or `_mbsetupuser`.
# For use with enrollment processes to delay the first policy until the
# Mac is past the Setup Assistant.
# 
# Created by Bryce McKenney
# 11292018
# 
#################################################################################

dockStatus=$(pgrep -x Dock)

while [ "$dockStatus" == "" ]; do
  sleep 2
  dockStatus=$(pgrep -x Dock)
done

loggedInUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')

while true; do
    if [ "${loggedinuser}" == "root" ] || [ "${loggedinuser}" == "_mbsetupuser" ]; then
        echo "is root or mbsetupuser"
        sleep 10
    else
        break
    fi
done