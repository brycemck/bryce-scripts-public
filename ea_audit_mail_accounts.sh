#!/bin/bash

#################################################################################
# 
# ea_audit_mail_accounts.sh
# 
# Built to query the db file that hosts all internet accounts and return
# the ones owned by Mail.app.
# 
# Created by Bryce McKenney
# 06272018
# 
#################################################################################

# Store original IFS
oldIFS=$IFS

# Get logged in user
loggedInUser=$( /usr/bin/stat -f %Su "/dev/console" )

# Default path of accounts DB
accountsDB="/Users/${loggedInUser}/Library/Accounts/Accounts4.sqlite"

# Check to see if DB file exists
if [ ! -f $accountsDB ]; then
    exit 1
fi

# Query file
IFS=","
usernamesRaw=

usernames=$( /usr/bin/sqlite3 $accountsDB "SELECT ZUSERNAME FROM ZACCOUNT WHERE ZOWNINGBUNDLEID='com.apple.mail'" -newline "," -nullvalue "NULL" )

# echo $usernames

for username in ${usernames[@]}; do
    if [ ! $username = "NULL" ]; then
        usernamesRaw+="${username},"
    fi
done

# Restore old IFS
IFS=$oldIFS

# Check if no usernames
usernamesRaw=${usernamesRaw%?}
if [ -z $usernamesRaw ]; then
    usernamesRaw="None"
fi

# Return usernames in extension attribute format
echo "<result>${usernamesRaw}</result>"