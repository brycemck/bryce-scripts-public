#!/bin/bash

#################################################################################
# 
# disable_mau.sh
# 
# Disables Microsoft Auto Updater by untrusting it, making it only available
# when manually opened.
# 
# Created by Bryce McKenney
# 12112018
# 
#################################################################################

loggedinuser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')

if [ -d "/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app" ]; then
    echo "Disabling MAU..."
    sudo -u "${loggedinuser}" /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -R -f -trusted /Library/Application\ Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app/Contents/MacOS/Microsoft AU Daemon.app
else
    echo "MAU removed prior to right now."
fi