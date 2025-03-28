# CHANGELOG

## v1.3.0 - 27 March 2025
- feat: Add the ability to customize note file format (62b831f)

## v1.2.0 - 10 November 2021
- feat: Implement ability to list note files with -l|--list flag (c171e75)

## v1.1.0 - 11 May 2021
- feat: Implement the ability to opt-out of using date-based directory
  organization (5b8b2a5)
- fix: Fixed a bug when using a custom note directory set in noterc file
  (eb0da17)
- fix: Fixed a typo in usage/help printout (1b67567)

## v1.0.0 - 31 March 2021
- General code cleanup and enhancements for 1.0 release (9e06464)
- Implement destroy and delete functionality (27cdeb2)
- Implement edit functionality (3e3ac32)
- Add ability to use a print program other than cat (26662cf)
- Removed the -i/--info flag (cae86fd)
- Improve argument handling (012e840)

## v0.6.0 - 27 March 2021
- Update the directory structure where notes are stored. (9dd754f)
- General improvements to the bash code (1b6d0a0, 1b6d0a0)

## v0.5.0 - 28 July 2020
- Implement -t | --time flag to add a timestamp when opening notes.

## v0.4.1 - 28 July 2020
- Fix noterc file path when XDG_CONFIG_HOME is not set

## v0.4.0 - 28 July 2020

- Added config file (noterc)
- Added ability to add custom filename via -n | --name
- Bash code is now less error-prone
- Fixed markdown syntax in CHANGELOG.md and README.md
- Thanks for the PR [@Madic-](https://github.com/Madic-)!

## v0.3.4 - 14 Feb 2019

- Alter text printed to terminal when a user opens an existing note to be friendlier
and more informative.

## v0.3.3 - 14 Feb 2019

- Fix a bug where vim opened in insert mode but didn't place cursor at end of file.

## v0.3.2 - 10 Sep 2018

- Add support for Emacs (Thanks for the PR [@alkc](https://github.com/alkc))!
  - Opens Emacs with cursor at EOF.

## v0.3.1 - 02 Aug 2018

- Add support for Neovim (Thanks for the PR [@jonathandion](https://github.com/jonathandion))!

## v0.3.0 - 02 Aug 2018

- By default it now opens a note using $EDITOR.
  - If no $EDITOR is set, it uses Vim.
  - If Vim is set as the default $EDITOR, it opens Vim in insert mode.
- Fixed stat output on Ubuntu/Linux machines.
- Added more information to `note -i` output.
- Added a success echo to install script.

## v0.2.1 - 01 Aug 2018

- Add ability to parse multiple command line arguments.
- Add graceful error handling with command line arguments.
- Reformat and beautify code.

## v0.2.0 - 01 Aug 2018

- Add `install.sh` script for easy installation.
- Enable `-i|--info` argument to print information about a note.
  - Add function to print a file preview + file stats.
- Update README with EZ Install instructions.

## v0.1.1 - 01 Aug 2018

- `note` now opens Vim in insert mode and puts the cursor at the end of the file
for even more rapid note taking!


## v0.1.0 - 01 Aug 2018

- Add ability to create and edit a new note.
- Add help/usage guide.
- Add ability to print note.
- Add README.
