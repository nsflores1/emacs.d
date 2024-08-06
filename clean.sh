#!/bin/sh -e
# clean up emacs files
echo "Do you wish to remove ALL unneeded files? [y/n]"
read choice
if [[ $choice == y* ]]; then
  echo "Removing Emacs files..."
  rm -rvI etc data snippets straight var
  echo "Task complete."
else
  echo "Quitting."
fi


