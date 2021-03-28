
# Convert Evernote .enex notebooks to Markdown

<img src="./img/obsidian-logo.png" align="right" width="250" />

This repo contains a shell script wrapper and pre-built configuration files for
the excellet <a href="https://github.com/akosbalasko/yarle">Yarle</a> utility
to convert your Evernote `.enex` files to Markdown documents.

Once your have your Evernotes in Markdown, you can then use them in 
something like <a href="https://obsidian.md/">Obsidian</a>.


## Prerequisites

You'll need <a href="https://nodejs.org/en/">Node.js</a> and `npx` installed.


## Usage

- `./evernote-to-markdown.sh notebook target_dir`

If Yarle is not installed, it will be installed automatically.

`target_dir` does not need to exist--it will be created by Yarle. 
Notes and will be placed inside that folder, and their attachments will
go into a folder called `_resources`.

If conversation is successfull, you'll see a message like this:

`Conversion finished: 12 succeeded, 0 skipped, 0 failed. Total notes: 12`


## Bugs

I used this script to convert several dozen Evernote notebooks I had totalling
over 3,000 notes.  All notes and attachments were exported successfully.

The only issue I had is that some of the paths to the attachments from the notes
weren't quite right, and required me to edit the markdown to correct them.
I personally considered it to be a minor inconvenience given how easy it was to
get so many notes safely out of Evernote.




