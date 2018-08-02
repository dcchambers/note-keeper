# note-keeper
A tiny script for taking and organizing simple text notes.

![gif](https://i.imgur.com/z70PRhk.gif)

* Write a TODO list.
* Use as a copy/paste clipboard.
* Make ASCII art. :)

:question: Why use this instead of just typing `vim /path/to/my/note.md` ?
* Type fewer characters.
* Print a note or print information about a note easily.
* Open the same note from anywhere.
* Automatically organizes notes with a sane directory structure.

# Installation
Note Keeper is a tiny shell script.

## EZ Install
Run this command in your terminal: `curl https://raw.githubusercontent.com/dcchambers/note-keeper/master/install.sh | bash`
* :warning: Always be careful when using `curl | bash` to install a
program/script. Read through the source code to make sure nothing malicious is
happening. This install script is easy...it's just 2 lines :wink:

## Manual Install
* Simply download the `note` script file.
* Place it somewhere nice (like `/usr/local/bin/`).
* Make it executable with `chmod +x`
* Add it to your `path` if necessary (e.g. `export PATH=$PATH:/usr/local/bin`)
* You can then run the script anywhere by simply typing `note` at the command line.

# Usage

* Running `note` by itself with no arguments will create a new note file
at ~/notes/$year/$month/$day.md if one does not exist, and will open that
note file in Vim.

* `-c | --create`
  * Use the `-c` flag to create a note without opening it.

* `-p | --print`
  * Use the `-v` flag to print the contents of the note.

* `-i | --info`
  * Use the `-i` flag to print information about a note.

* `-e | --edit <Date>`
  * :warning: Not yet implemented!
  * Use the `-e` flag with a DATE argument to edit a note from a specific date.

* `-h | --help`
  * Use the `-h` flag to print usage information.

# Demo

[![asciicast](https://asciinema.org/a/194428.png)](https://asciinema.org/a/194428)

# File Organization

```
$ tree ~/notes
/home/username/notes
└── 2018
    ├── 07
    │   └── 31.md
    └── 08
        ├── 01.md
        └── 02.md

```

# Configuration

* The default editor is set by your `$EDITOR` environment variable.
  * If no default editor is set, it will use *Vim*.
    * It opens *vim* in insert mode.
* The default location to store notes is in the `~/notes/` directory.
  * To change this, edit the variable `$note_path` on line 42, and edit the `mkdir` command in the `create_note` function, line 5.
