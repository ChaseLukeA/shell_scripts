# Changed Files - check to see what files have changed
# between the start and end time of this script
# By Luke A Chase
# chase.luke.a@gmail.com
# Copyright 2014

# In terminal, type "cd /" to go to the root folder
# Type "sudo -s" to get a root shell
# Type "touch ~/timestamp" to create a timestamp file
#   This creates/updates a file to compare changed
#   files to (anything created after this stamp)
# Type "find -x / -newer ~/timestamp >~/changedfiles.txt"
#   to create changedfiles.txt in your user folder
clear

ROOT_UID="0"

# Check if run as root
if [ "$UID" -ne "$ROOT_UID" ] ; then
  echo
  echo ┌────────────────────────────────────────────────────────┐
  echo │ You must be root \(sudo\) to create a changed files log! │
  echo │ Type \"sudo -s\" and enter your password then try again. │
  echo └────────────────────────────────────────────────────────┘
  echo
    exit 1
fi

echo ┌────────────────────────────────────────────────────────┐
echo │\ \ \ \ \ \ \ \ \ \ \ \ \ \ Watch For Changed Files v1.0\ \ \ \ \ \ \ \ \ \ \ \ \ \ │
echo ├────────────────────────────────────────────────────────┤
echo │\ \ \ \ \ \ \ \ \ \ \ \ Look for files that have changed\ \ \ \ \ \ \ \ \ \ \ \ │
echo │\ \ \ \ \ \ during the current instance of this program\ \ \ \ \ \ \ │
echo └────────────────────────────────────────────────────────┘


# Run the changed files program
cd /
touch ~/timestamp
echo ┌────────────────────────────────────────────────────────┐
echo │ Access or change the programs or files or settings for │
echo │ \ the file\(s\) you want to find and then press [Enter].\  │
echo └────────────────────────────────────────────────────────┘
read -p ""
echo \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Working...
find -x / -newer ~/timestamp >~/changedfiles.txt
open ~/changedfiles.txt
exit
