# Changed Files - check to see what files have changed
# between the start and end time of this script
#
# By Luke A Chase
# chase.luke.a@gmail.com
# Copyright 2015
clear

ROOT_UID="0"

# Check if run as root --------------------------------------------------------
if [ "$UID" -ne "$ROOT_UID" ] ; then
  echo "┌────────────────────────────────────────────────────────┐"
  echo "│ You must be root (sudo) to create a changed files log! │"
  echo "│ Type \"sudo -s\" and enter your password then try again. │"
  echo "└────────────────────────────────────────────────────────┘"
  echo
    exit 1
fi
#------------------------------------------------------------------------------

echo "┌────────────────────────────────────────────────────────┐"
echo "│              Watch For Changed Files v1.1              │"
echo "├────────────────────────────────────────────────────────┤"
echo "│            Look for files that have changed            │"
echo "│      during the current instance of this program       │"
echo "└────────────────────────────────────────────────────────┘"
echo


# Run the changed files program
cd /
touch ~/timestamp
echo "┌────────────────────────────────────────────────────────┐"
echo "│ Access or change the programs or files or settings for │"
echo "│  the file(s) you want to find and then press [Enter].  │"
echo "└────────────────────────────────────────────────────────┘"
read -p ""
echo "                        Working..."
find -x / -newer ~/timestamp >~/changedfiles.txt
open ~/changedfiles.txt
exit
