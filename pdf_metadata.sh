# Script for retreiving and updating metadata in pdf files
# using the free PDFtk server command-line tools available at
# https://www.pdflabs.com/tools/pdftk-server/
#
# By Luke A Chase
# chase.luke.a@mgail.com
# Copyright 2015

# GETTING METADATA:
#   pdftk $fileIn dump_data_utf8 output $fileOut
# SAVING METADATA:
#   pdftk $fileIn update_info_utf8 $dataFile output $fileOut
#
# clears the screen before starting script
clear

echo "┌──────────────────────────────────────────────────────────────────────┐"
echo "│             PDF Metadata Retreiver & Updater Version 1.0             │"
echo "└──────────────────────────────────────────────────────────────────────┘"
echo

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

if [ $# == 0 ]; then  # no arguments passed

  echo "Usage: (<f> = filename)"
  echo
  echo "  pdf <f>.pdf               ->  gets metadata from specified pdf file"
  echo "                                and saves it to <filename>.pdf.meta"
  echo
  echo "  pdf -u <f>.pdf            ->  updates metadata in specified pdf file"
  echo "                                from existing <filename>.pdf.meta file"
  echo
  echo "  pdf -u <f1>.pdf <f2>.pdf  ->  updates metadata in <f1>.pdf file"
  echo "                                from existing <f1>.pdf.meta file and"
  echo "                                creates a new pdf named <f2>.pdf"
  echo

elif [ $# == 1 ]; then  # one argument passed --> get metadata

  fileIn=$1
  metaFile=${fileIn}.meta

  if [ ! -f "$metaFile" ]; then  # meta output file doesn't exist

    echo
    echo "  Getting metadata from \"$fileIn\"..."
    echo

    pdftk $fileIn dump_data_utf8 output $metaFile

    echo "  Got metadata from \"$fileIn\" successfully!"
    echo
    echo "Would you like to edit the metadata file now with vim?"
    read answer

    if [ $answer = "y" -o $answer = "Y" -o $answer = "yes" -o $answer = "YES"]; then

      vim $metaFile

    fi
    
  else  # meta output file already exists

    echo
    echo "  Cannot write metadata for '$fileIn' ->"
    echo "    Reason: $metaFile already exists!"
    echo

  fi

elif [ $# == 2 ]; then  # two arguments passed

  flag=$1
  fileIn=$2
  metaFile=${fileIn}.meta

  if [ $flag = "-u" ]; then

    mv $fileIn _$fileIn
    pdftk _$fileIn update_info_utf8 $metaFile output $fileIn
    #rm _$fileIn

    echo
    echo "  Update metadata in \"$fileIn\" successfully!"
    echo
    
  else

    echo
    echo "  Unexpected flag as first argument -> please try again"
    echo

  fi

elif [ $# == 3 ]; then  # three arguments passed

  flag=$1
  fileIn=$2
  fileOut=$3
  metaFile=${fileIn}.meta

  if [ $1 = "-u" ]; then
    
    pdftk $fileIn update_info_utf8 $metaFile output $fileOut

    echo
    echo "  Created new file \"$fileOut\" with metadata successfully!"
    echo

  else

    echo
    echo "  Unexpected flag as first argument -> please try again"
    echo

  fi

else  # anything else passed

  echo "  Something unexpected happened -> please try again"
  echo

fi

IFS=$SAVEIFS
