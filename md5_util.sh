# Script for creating an md5 hash of a file
# By Luke A Chase
# chase.luke.a@mgail.com
# Copyright 2015

# clears the screen before starting script
clear

errorMsg="Invalid parameter(s) passed in. Please run \"md5hash\" for help."
matchSuccess="File hashes match! Both files are identical."
matchFailure="File hashes DO NOT MATCH!"

echo "┌──────────────────────────────────────────────────────────────────────┐"
echo "│                    MD5 CheckSum Hasher Version 1.1                   │"
echo "└──────────────────────────────────────────────────────────────────────┘"
echo

if [ $# == 0 ]; then  # no arguments passed

  echo "  Usage:"
  echo
  echo "  md5hash <file>            ->  create hash of 'file'"
  echo "  md5hash <file> <file>     ->  compare hashes for both files (w/.md5)"
  echo "  md5hash -i <file> <file>  ->  compare 'instant' hashes for both files"
  echo

elif [ $# == 1 ]; then  # one argument passed --> hash the file

  file1=$1

  if [ ! -f "$file1.md5" ]; then  # hash file doesn't exist

    echo "  Hashing \"$file1\"..."

    file1="${file1// /\ }"
    md5 -q $file1 >> $file1.md5
    chflags hidden $file1.md5

    echo
    echo "  \"$file1\" was hashed successfully!"
    echo
    
  else  # hash file already exists

    echo "  Cannot hash '$file1' -> hash file already exists!"
    echo

  fi

elif [ $# == 2 ]; then  # two arguments passed --> if hash files exist for both
                        # files, compare the hash files for both files
  file1=$1
  file2=$2

  if [ ! -f "$file1.md5" ] || [ ! -f "$file2.md5" ]; then  # no hash file(s)

    if [ ! -f "$file1.md5" ]; then  # no hash file for file1

      echo
      echo "  No hash file exists for \"$file1\"!"
      echo "  Please run \"hash $file1\" to create a hash file for it."
      echo

    fi

    if [ ! -f "$file2.md5" ]; then  # no hash file for file2

      echo "  No hash file exists for \"$file2\"!"
      echo "  Please run \"hash $file2\" to create a hash file for it."
      echo

    fi

  else  # hashes exist for both files --> compare the hash files

    echo "  Comparing file hashes for"
    echo "    \"$file1\" AND"
    echo "    \"$file2\"..."
    echo

    equal=`diff $file1.md5 $file2.md5`

    if [ ! -n "$equal" ]; then

      echo "  $matchSuccess"
      echo

    else

      echo "  $matchFailure"
      echo

    fi

  fi

elif [ $# == 3 ]; then  # three arguments passed

  if [ $1 = "-i" ]; then
    
    if [ `md5 -q $2` = `md5 -q $3` ]; then

      echo "  $matchSuccess"
      echo

    else

      echo "  $matchFailure"
      echo

    fi

  else

    echo "  $errorMsg"
    echo

  fi

else

  echo "  $errorMsg"
  echo

fi
