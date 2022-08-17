#!/bin/bash

#################################################################################
# 
# remove_adobe_override.sh
# 
# Looks to see if the Adobe override file exists, and if it does, removes
# it.
# 
# Created by Bryce McKenney
# 04292019
# 
#################################################################################

overridePath="/Library/Application Support/Adobe/AAMUpdater/1.0/AdobeUpdater.Overrides"

if [[ -f "$overridePath" ]]; then
    echo "exists, deleting..."
    rm "$overridePath"
else
    echo "doesn't exist."
fi