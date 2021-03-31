# Notekeeper

![Shellcheck](https://github.com/dcchambers/note-keeper/actions/workflows/shellcheck.yml/badge.svg)

A tiny bash script for taking and organizing simple text notes.

![](assets/notekeeper-demo.gif)

- Write a TODO list.
- Use as a copy/paste clipboard.
- Make ASCII art. :)

:question: Why use this instead of just typing `vim /path/to/my/note.md` ?

- Type fewer characters.
- Print and manage note files easily.
- Open the same note from any directory.
- Automatically organizes notes with a sane directory structure.

## Installation

### Homebrew
- Notekeeper can be easily installed via homebrew!
```
brew tap dcchambers/tap
brew update && brew install notekeeper
```
### Manual Install

- Simply download the `note.bash` script file.
- Place it somewhere nice (`mv note.bash /usr/local/bin/note`).
- Make it executable with `chmod +x /usr/local/bin/note`
- Add it to your `path` if necessary (e.g. `export PATH=$PATH:/usr/local/bin`)
- You can then run the script anywhere by simply typing `note` at the command line.

## Usage

- Running `note` by itself with no arguments will create a new note file
at `~/$NOTE_DIR/$year/$month/$day/$year-$month-$day.md` if one does not exist,
and will open that note file in Vim.

- `-c | --create`
  - Use the `-c` flag to create a note without opening it.
- `-p | --print`
  - Use the `-p` flag to print the contents of the note.
- `-n | --name <FILENAME>`
  - Set filename for note. Will be created in $NOTE_DIR.
    Can be combined with other options (-c, -p, -t)
- `-e | --edit <FILENAME>`
  - Use the `-e` flag with a DATE argument to edit a note from a specific date.
- `-h | --help`
  - Use the `-h` flag to print usage information.
- `-t | --time`
  - Use the `-t` flag to add a timestamp when creating/opening note.
- `-d | --delete <FILENAME`
  - Use the `-d` flag to move a file into trash (`$NOTE_DIR/trash`)
- `--destroy <FILENAME>`
  - Use the `--destroy` flag to permanently delete a note.

## Demo

[![asciicast](https://asciinema.org/a/404264.png)](https://asciinema.org/a/404264)

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

- The default editor is set by your `$EDITOR` environment variable.
  - If no default editor is set, it will use *Vim*.
    - It opens *Vim* in insert mode.
- The default location to store notes is in the `~/notes/` directory.
  - To change this, set a `NOTE_DIR` value in your `noterc` file.

### Customize with noterc

You can use a `noterc` file to customize Notekeeper!

- Create this file at `${XDG_CONFIG_HOME}/notekeeper/noterc`
  - On MacOS, this will be `~/.config/notekeeper/noterc`

The following variables can be set to overwrite Notekeeper defaults:

- `NOTE_DIR` - The base directory for storing notes.
  - Default is `~/notes`
- `EDITOR`
  - By default Notekeeper uses whatever is in your system `$EDITOR` variable,
    and falls back to vim if none is set.
- `NOTE_NAME` - Default name for new notes that are created.
  - The default is `$YEAR-$MONTH-$DAY.md`
- `PRINT_TOOL`
  - Default is `cat`

## Dependencies

- Notekeeper uses a few simple tools that you probably already have installed.
  - A text editor (such as *Vim* or *Emacs*)
  - The `find` program
  - A program to print files (like `cat`)
  - Basic programs that should be included in almost all Linux/Unix
    distributions, including `mkdir`, `touch`, `mv`, `rm`, `echo`, `printf`
