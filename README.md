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

## Installation

Note Keeper is a tiny shell script.

### EZ Install

Run this command in your terminal:  
`curl https://raw.githubusercontent.com/dcchambers/note-keeper/master/install.sh | bash`  

:bulb: Get a `permission denied` error? You might need to run the script with `sudo`. Try this:  
`curl https://raw.githubusercontent.com/dcchambers/note-keeper/master/install.sh | sudo bash`

* :warning: Always be careful when using `curl | bash` to install a program/script. Read through the source code to make sure nothing malicious is happening. This install script is easy...it's just 2 lines :wink:

### Manual Install

* Simply download the `note` script file.
* Place it somewhere nice (like `/usr/local/bin/`).
* Make it executable with `chmod +x`
* Add it to your `path` if necessary (e.g. `export PATH=$PATH:/usr/local/bin`)
* You can then run the script anywhere by simply typing `note` at the command line.

## Usage

* Running `note` by itself with no arguments will create a new note file
at ~/notes/$year/$month/$day.md if one does not exist, and will open that
note file in Vim.

* `-c | --create`
  * Use the `-c` flag to create a note without opening it.

* `-p | --print`
  * Use the `-v` flag to print the contents of the note.

* `-i | --info`
  * Use the `-i` flag to print information about a note.

* `-n | --name`
  * Set filename for note. Will be created in $NOTE_DIR. Don't forget an extension like .md.

* `-e | --edit <Date>`
  * :warning: Not yet implemented!
  * Use the `-e` flag with a DATE argument to edit a note from a specific date.

* `-h | --help`
  * Use the `-h` flag to print usage information.

* `-t | --time`
  * Use the `-t` flag to add a timestamp when opening a note.


## Demo

[![asciicast](https://asciinema.org/a/194428.png)](https://asciinema.org/a/194428)

## File Organization

```shell
❱❱ tree ~/notes
/home/username/notes
└── 2020
    ├── 06
    │   ├── 21
    │   │   └── 2020-06-21.md
    │   └── 22
    │       └── 2020-06-22.md
    └── 07
        └── 28
            ├── 2020-07-28.md
            └── another-note.md
```

## Configuration

* The default editor is set by your `$EDITOR` environment variable.
  * If no default editor is set, it will use *Vim*.
    * It opens *vim* in insert mode.
* The default location to store notes is in the `~/notes/` directory.
  * To change this, set a `NOTE_DIR` value in your `noterc` file.


### noterc

You can use a `noterc` file to customize Notekeeper!

* Create this file at `${XDG_CONFIG_HOME}/notekeeper/noterc`
  * On MacOS, this will be `~/.config/notekeeper/noterc`

The following variables can be set to overwrite Notekeeper defaults:

* `NOTE_DIR` - The base directory for storing notes.
  * Default is `~/notes`

* `EDITOR`
  * By default Notekeeper uses whatever is in your `$EDITOR` variable, and falls back to vim if none is set.

* `NOTE_NAME`
  * Default is `$YEAR-$MONTH-$DAY.md`
