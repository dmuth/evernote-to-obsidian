#!/bin/bash
#
# Imports a notebook from Evernote into Markdown files
#

# Errors are fatal
set -e

if test ! "$1"
then
	echo "! "
	echo "! Syntax: $0 directory"
	echo "! "
	echo "! directory - The directory containing Evernote .enex format notebooks"
	echo "! "
	exit 1
fi

NOTEBOOK=$1
TARGET="markdown-exports"

if test ! $(which yarle) 
then
	echo "# Installing yarle..."
	npm install -g yarle-evernote-to-md
else
	echo "# Yarle already installed..."
fi

#
# Write our configuration file which Yarle uses.
#
cat config.json.in \
	| sed -e "s|%DIR%|$(pwd)|g" -e "s|%NOTEBOOK%|${NOTEBOOK}|g" -e "s|%TARGET%|${TARGET}|g" \
	> config.json

yarle --configFile ./config.json

#
# This crazy logic here is to do the following:
# 
# 1) Move the various notebooks out of the notes/ directory and into the parent, because
# I see not point to the notes/ directory existing.
# 
# 2) In an effort to make things more user-friendly, if this script has been run before,
# simply add an ascending number to the end and try again, instead of having the script bail.
#
#
echo
echo
echo "# Moving directories from ${TARGET}/notes/ into just ${TARGET}..."
pushd ${TARGET} > /dev/null
for FILE in notes/*
do
	DEST=$(basename "${FILE}")
	if test -e "${DEST}"
	then
		I=1
		DEST="${DEST}.${I}"
		echo "# Checking for ${DEST}..."
		while test -e "${DEST}"
		do
			echo "# Looks like ${DEST} already exists, let's increment and try again..."
			I=$(( I += 1 ))
			DEST=$(basename "${FILE}")
			DEST="${DEST}.${I}"
		done

		echo "# Our new target will be ${DEST}!"
	fi

	echo "# Moving notes/${FILE} to ${DEST}..."
	mv "${FILE}" "${DEST}"

done

rm -rf notes
popd > /dev/null


