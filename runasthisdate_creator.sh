# Script for creating a new "this date" running script for time trial software
# By Luke A Chase
# chase.luke.a@gmail.com
# Copyright 2015

# clears the screen before starting script
clear

# informs the user of this script's purpose
echo ┌───────────────────────────────────────────────────────┐
echo │\ \ \ \ \ \ \ \ \ \ \ \ \ \ \"Run As This Date\" Creator\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ │
echo └───────────────────────────────────────────────────────┘
echo

# prompts for user-specified application name
echo
echo \ Please enter the name of the application you would like
echo \ to use from the /Applications/ folder:
echo
read appName

# informs the user of their chosen directory
echo \ 
echo Creating the $appName.sh file...

# inserts "need to be sudo" logic
echo \# Clear the screen >> $appName.sh
echo clear >> $appName.sh
echo >> $appName.sh

echo \# Check if run as root >> $appName.sh
echo ROOT_UID=\"0\" >> $appName.sh
echo >> $appName.sh

echo "if [ \"\$UID\" -ne \"\$ROOT_UID\" ] ; then" >> $appName.sh
echo \ \ echo >> $appName.sh
echo \ \ echo ┌────────────────────────────────────────────────────────┐ >> $appName.sh
echo "  echo │ You must be root \(sudo\) to create a changed files log! │" >> $appName.sh
echo "  echo │ Type \\\"sudo -s\\\" and enter your password then try again. │" >> $appName.sh
echo \ \ echo └────────────────────────────────────────────────────────┘ >> $appName.sh
echo \ \ echo >> $appName.sh
echo \ \ \ \ exit 1 >> $appName.sh
echo fi >> $appName.sh
echo >> $appName.sh

# insert current date & time variables
echo "# get current date & time" >> $appName.sh
echo year=\`date +%y\` >> $appName.sh
echo month=\`date +%m\` >> $appName.sh
echo day=\`date +%d\` >> $appName.sh
echo hour=\`date +%H\` >> $appName.sh
echo minute=\`date +%M\` >> $appName.sh
echo >> $appName.sh

# get current date & time
year=`date +%y`
month=`date +%m`
day=`date +%d`
hour=`date +%H`
minute=`date +%M`

# insert current date & time
echo "# set date & time to \"Run As This Date\" date & time" >> $appName.sh
echo date $month$day$hour$minute$year >> $appName.sh
echo >> $appName.sh

# insert timer to prevent fast loading app
echo "# timer to prevent fast loading app" >> $appName.sh
echo sleep 5 >> $appName.sh
echo >> $appName.sh

# replace all spaces in string with "\ " for unix
appNameFormatted="${appName// /\ }"

# insert open $appName
echo "# open app while date & time is modified" >> $appName.sh
echo open /Applications/$appNameFormatted.app >> $appName.sh
echo >> $appName.sh

# insert timer to prevent date & time from resetting before app is loaded
echo "# timer to prevent date & time from resetting before app is loaded" >> $appName.sh
echo sleep 60 >> $appName.sh
echo >> $appName.sh

# insert date & time reset
echo "# date & time reset to current date & time" >> $appName.sh
echo date \$month\$day\$hour\$minute\$year >> $appName.sh
