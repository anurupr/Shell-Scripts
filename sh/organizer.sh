#!/bin/bash


ORGANIZER_PATH=~/.config/organizer
CONFIG_FILE="$ORGANIZER_PATH/conf/organizer.conf"
CLUTTER_FREE_PATH="/media/anurup/MUSIC/clutter-free"
CLUTTER_PATH="$CLUTTER_FREE_PATH/clutter"
ARCHIVES_PATH="$CLUTTER_FREE_PATH/compressed/"
DISKIMAGES_PATH="$CLUTTER_FREE_PATH/compressed/diskimages"
PACKAGES_PATH="$CLUTTER_FREE_PATH/compressed/packages"

cd $CLUTTER_PATH

. $CONFIG_FILE

# delete all empty directories first
echo "Deleting empty directories"
find . -type d -empty -print

echo "Confirm delete ? y/n"
read input
if [ $input == "y" ]; then
  find . -type d -empty -delete
fi

# delete common files and folders of linux
while read -r file
do 
	#rm -- "$file"
	find -name "*$file*" -exec rm -r "{}" \;
done < "$ORGANIZER_PATH/$COMMON_FILES_LIST"


echo "Moving all archives to $ARCHIVES_PATH"
while read line
do
	mv -v "$line" $ARCHIVES_PATH/
done < <(find . -type f -not -name "*.jar" -not -name "*.ap*" -exec sh -c 'file -zb "$1" | grep -q "archive"' _ {} \; -print)

echo "Moving all diskimages to $DISKIMAGES_PATH"
while read line
do
	mv -v "$line" $DISKIMAGES_PATH/
done < <(find . -type f -name "*.img.*" )

echo "Moving all packages to $PACKAGES_PATH"
while read line
do
	mv -v "$line" $PACKAGES_PATH/
done < <(find . -type f -name "*.deb*" )
