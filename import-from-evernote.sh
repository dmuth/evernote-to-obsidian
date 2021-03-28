#!/bin/bash
#
# Imports a notebook from Evernote into Markdown files
#

# Errors are fatal
set -e

if test ! "$2"
then
	echo "! "
	echo "! Syntax: $0 notebook target_dir"
	echo "! "
	echo "! notebook - The Evernote .enex file we want to read"
	echo "! target_dir - Where are we writing the markdown?"
	echo "! "
	exit 1
fi

NOTEBOOK=$1
TARGET=$2

if test ! $(which yarle) 
then
	echo "# Installing yarle..."
	npm install -g yarle-evernote-to-md
else
	echo "# Yarle already installed..."
fi

cat config.json.IN \
	| sed -e "s|%DIR%|$(pwd)|g" -e "s|%NOTEBOOK%|${NOTEBOOK}|g" -e "s|%TARGET%|${TARGET}|g" \
	> config.json

yarle --configFile ./config.json

