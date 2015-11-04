# Script for creating a new "this date" running script for running
# software at different dates & times than the current date & time
#
# By Luke A Chase
# chase.luke.a@gmail.com
# Copyright 2015

# clears the screen before starting script
clear

# informs the user of this script's purpose
echo "┌───────────────────────────────────────────────────────┐"
echo "│       \"Run As This Date\" Creator Version 1.1          │"
echo "└───────────────────────────────────────────────────────┘"
echo

# prompts for user-specified application name
echo
echo "Please enter the name of the application you would like"
echo "to use from the /Applications/ folder:"
echo
read appName

appScript=${appName}.sh

# informs the user of their chosen directory
echo 
echo "Creating the $appScript file..."

# Creation of appScript.sh file -------------------------------------------------

# inserts "need to be sudo" logic
echo "# Clear the screen" >> $appScript
echo "clear" >> $appScript
echo >> $appScript

echo "# Check if run as root" >> $appScript
echo "ROOT_UID=\"0\"" >> $appScript
echo >> $appScript

echo "if [ \"\$UID\" -ne \"\$ROOT_UID\" ] ; then" >> $appScript
echo "  echo" >> $appScript
echo "  echo \"┌────────────────────────────────────────────────────────┐\"" >> $appScript
echo "  echo \"│ You must be root (sudo) to create a changed files log! │\"" >> $appScript
echo "  echo \"│  Type \\\"sudo -s\\\" and enter your password then try again.│\"" >> $appScript
echo "  echo \"└────────────────────────────────────────────────────────┘\"" >> $appScript
echo "  echo" >> $appScript
echo "    exit 1" >> $appScript
echo "fi" >> $appScript
echo >> $appScript

# insert current date & time variables
echo "# get current date & time" >> $appScript
echo "year=\`date +%y\`" >> $appScript
echo "month=\`date +%m\`" >> $appScript
echo "day=\`date +%d\`" >> $appScript
echo "hour=\`date +%H\`" >> $appScript
echo "minute=\`date +%M\`" >> $appScript
echo "minute=\$((\$minute + 1))" >> $appScript
echo >> $appScript

# get current date & time
year=`date +%y`
month=`date +%m`
day=`date +%d`
hour=`date +%H`
minute=`date +%M`

# insert current date & time
echo "# set date & time to \"Run As This Date\" date & time" >> $appScript
echo "date $month$day$hour$minute$year" >> $appScript
echo >> $appScript

# insert timer to prevent fast loading app
echo "# timer to prevent fast loading app" >> $appScript
echo "sleep 5" >> $appScript
echo >> $appScript

# replace all spaces in string with "\ " for unix
appNameFormatted="${appName// /\ }"

# insert open $appScript
echo "# open app while date & time is modified" >> $appScript
echo "open /Applications/${appNameFormatted}.app" >> $appScript
echo >> $appScript

# insert timer to prevent date & time from resetting before app is loaded
echo "# timer to prevent date & time from resetting before app is loaded" >> $appScript
echo "sleep 60" >> $appScript
echo >> $appScript

# insert date & time reset
echo "# date & time reset to current date & time" >> $appScript
echo "date \$month\$day\$hour\$minute\$year" >> $appScript
