#!/bin/bash

#################################################################################
# 
# uninstall_application.sh
# 
# Quits and uninstalls an application by its
# name and its path. Includes error handling.
# 
# Created by Bryce McKenney
# 08172022
# 
#################################################################################

# logged in user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`
currentUserUID=`id -u "$loggedInUser"`

# appName and appPath need to be set in the Script Paramaters in the Jamf Policy that runs this script.
#
# - appName needs to be synonomous with how
#   it appears in Activity Monitor of the Mac
#   i.e. Google Chrome
# - appPath needs to be the full absolute path to the
#   application. i.e. /Applications/Google Chrome.app

appName="$4"
appPath="$5"

# Quit the app
if killall "$appName" &>/dev/null; then
    echo "$appName stopped."
else
	echo "$appName wasn't running."
fi

# Delete the app if it exists
if [[ -e $appPath ]]; then
    if rm -rf "$appPath" &>/dev/null; then
        echo "$appName successfully removed."
    else 
        echo "Failed to remove $appName at $appPath. Exiting with a failure."
        exit 1
    fi
else
    echo "$appName does not exist at $appPath."
fi