# Script for creating a web template
# By Luke A Chase
# chase.luke.a@gmail.com
# Copyright 2014

# clears the screen before starting script
clear

# informs the user of this script's purpose
echo "┌───────────────────────────────────────────────────────┐"
echo "│       Create Web Site Directory And Default Files     │"
echo "└───────────────────────────────────────────────────────┘"
echo

# prompts for user-specified directory name
echo
echo "Please enter the directory name you would like to use:"
read directory

# informs the user of their chosen directory
echo
echo "Creating files and folders in your $directory folder..."

# creates folders and subfolders
mkdir -p $directory/css
mkdir -p $directory/images
mkdir -p $directory/js
touch $directory/index.html
touch $directory/css/style.css
touch $directory/js/script.js
cd $directory

# pushes html code into index.html
echo "<!DOCTYPE html>" >> index.html
echo >> index.html
echo "<html lang=\"en-US\">" >> index.html
echo "  <head>" >> index.html
echo "    <meta charset=\"utf-8\">" >> index.html
echo "    <title></title>" >> index.html
echo "    <link href=\"css/style.css\" rel=\"stylesheet\">" >> index.html
echo "  </head>" >> index.html
echo >> index.html
echo "  <body>" >> index.html
echo >> index.html
echo "    <script type=\"text/javascript\" src=\"js/script.js\"></script>" >> index.html
echo "  </body>" >> index.html
echo "</html>" >> index.html


# informs the user their directory creation was successful
echo
echo "The $directory folder creation has completed successfully!"
echo
