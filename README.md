
# Convert Evernote .enex notebooks to Markdown

<img src="./img/obsidian-logo.png" align="right" width="250" />

This repo contains a shell script wrapper and pre-built configuration files for
the excellent <a href="https://github.com/akosbalasko/yarle">Yarle</a> utility
to convert your Evernote `.enex` files to Markdown documents.

Once you have your Evernotes in Markdown, you can then use them in 
something like <a href="https://obsidian.md/">Obsidian</a>.


## Prerequisites

You'll need <a href="https://nodejs.org/en/">Node.js</a> and `npx` installed.

Your Evernote notebooks to be converted should be in the directory `evernote-notebooks/`:

<img src="img/1-before.png" width="400" align="center" />


## Usage

- `./convert-evernote-to-markdown.sh directory`

`directory` is the directory containing Evernote `.enex` format exported notebooks.  
I personally recommend `evernote-notebooks/` for the name.

If Yarle is not installed, it will be installed automatically. In this case, you will need to run
it in `sudo` mode.

If conversion is successful, you'll see a message like this:

`Conversion finished: 12 succeeded, 0 skipped, 0 failed. Total notes: 12`

...and your exported notes will be in the `markdown-exports/` directory:

<img src="img/2-after.png" width="600" />


## Bugs

I used this script to convert several dozen Evernote notebooks totalling
over 3,000 notes.  All notes and attachments were exported successfully.

The only issue I had is that some of the paths to the attachments from the notes
weren't quite right, and required me to edit the markdown to correct them.
I personally considered it to be a minor inconvenience given how easy it was to
get so many notes safely out of Evernote.


## Further Reading

You can read about how I used this script to migrate 3,000 Evernotes from Evernote to Obsidian
<a href="https://www.dmuth.org/migrating-from-evernote-to-obisidian/">over on my blog</a>
or <a href="https://dmuth.medium.com/migrating-your-notes-from-evernote-to-obsidian-dcdbf9ffb4f0">on Medium</a>.


## Who built this? / Contact

My name is Douglas Muth, and I am a software engineer in Philadelphia, PA.

There are several ways to get in touch with me:
- Email to doug.muth AT gmail DOT com or dmuth AT dmuth DOT org
- [Facebook](https://facebook.com/dmuth) and [Twitter](http://twitter.com/dmuth)
- [LinkedIn](https://linkedin.com/in/dmuth)

Feel free to reach out to me if you have any comments, suggestions, or bug reports.

