# My Mac OS X / Linux / UNIX shell scripts & vimrc

##changed_files.sh
A script ran as root that saves a timestamp of current time. After starting changed_files.sh, access programs or files that you may not know where they're being accessed at (like temp files, system files, etc), then press enter to start a complete search of all files that have changed since you started the script. Results are saved to ~/changedfiles.txt

##md5_util.sh
A script to make md5 hashing and checking of two files easy from the terminal. Run md5.sh for instructions on usage.

##pdf_metadata.sh
A script to output the current metadata/bookmark/info from a PDF file for editing, then allows updating of the metadata back into the same PDF or a different file name. This uses the free PDFtk toolkit available from https://www.pdflabs.com/tools/pdftk-server/.

##runasthisdate_creator.sh
A script that creates a "runasthisdate" script meant to open a specific application/file/etc with the system set to the date it was at when the "runasthisdate" script was created.

##web_template.sh
A script to create a web template - folders, files, etc - with a user-inputtable folder name. Creates an index.html file, css/style.css, images/, and js/script.js file.

##vimrc
My vimrc file that I use on Mac OS X, Ubuntu, and Windows 10 for various versions of vim. This script also works good with the Xcode and Android Studio vim wrappers.
