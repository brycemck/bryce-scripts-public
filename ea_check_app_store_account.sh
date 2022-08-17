#!/bin/bash

#################################################################################
# 
# ea_check_app_store_account.sh
# 
# Extension attribute that returns the account that the
# macOS App Store is signed into.
# 
# Created by Bryce McKenney
# 
#################################################################################

loggedInUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')

plistbud=$(/usr/libexec/PlistBuddy -c "Print :PrimaryAccount:0:1:identifier" /Users/${loggedInUser}/Library/Preferences/com.apple.commerce.plist 2>/dev/null)
exitCode=$?

if [[ $exitCode == 0 ]] ; then
    AppleID=`echo "$plistbud" | sed -e 's/[\/&]/\\&/g'`
else
    AppleID=""
fi

if [[ -n "$AppleID" ]]; then
    echo "<result>${AppleID}</result>"
else
    echo "No user logged in."
fi

exit 0