# CHANGELOG

## v0.3.1 - 02 Aug 2018
* Add support for Neovim (Thanks for the PR [@jonathandion](https://github.com/jonathandion)!

## v0.3.0 - 02 Aug 2018
* By default it now opens a note using $EDITOR.
  * If no $EDITOR is set, it uses Vim.
  * If Vim is set as the default $EDITOR, it opens Vim in insert mode.
* Fixed stat output on Ubuntu/Linux machines.
* Added more information to `note -i` output.
* Added a success echo to install script.

## v0.2.1 - 01 Aug 2018
* Add ability to parse multiple command line arguments.
* Add graceful error handling with command line arguments.
* Reformat and beautify code.

## v0.2.0 - 01 Aug 2018
* Add `install.sh` script for easy installation.
* Enable `-i|--info` argument to print information about a note.
  * Add function to print a file preview + file stats.
* Update README with EZ Install instructions.

## v0.1.1 - 01 Aug 2018
* `note` now opens Vim in insert mode and puts the cursor at the end of the file
for even more rapid note taking!


## v0.1.0 - 01 Aug 2018
* Add ability to create and edit a new note.
* Add help/usage guide.
* Add ability to print note.
* Add README.
