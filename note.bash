#!/usr/bin/env bash

# shellcheck source="${XDG_CONFIG_HOME:-$HOME/.config}/notekeeper/noterc"
# shellcheck disable=SC1091

YEAR=$(date +'%Y')
MONTH=$(date +'%m')
DAY=$(date +'%d')

# Set default configuration
NOTE_DIR="$HOME/notes"
BASE_NOTE_DIR=$NOTE_DIR
NOTE_NAME="$YEAR-$MONTH-$DAY.md"
PRINT_TOOL="cat"

# Overwrite default configs from noterc configuration file
NOTERC="${XDG_CONFIG_HOME:-$HOME/.config}/notekeeper/noterc"
if [ -f "$NOTERC" ]; then source "$NOTERC"; fi

NOTE_DIR="$NOTE_DIR/$YEAR/$MONTH/$DAY"

create_note() {
    if [ ! -f "$NOTE_DIR/$NOTE_NAME" ]; then
        mkdir -p "$NOTE_DIR"
        touch "$NOTE_DIR/$NOTE_NAME"
        printf "%s-%s-%s\n---\n\n" "$DAY" "$MONTH" "$YEAR" > "$NOTE_DIR/$NOTE_NAME"
        printf "Created new note: %s/%s\n" "$NOTE_DIR" "$NOTE_NAME"
    fi
}

print_help() {
    printf "Notekeeper 1.0 (31 March 2021)

Usage: note [<args>]

Arguments:
  -h | --help                         Display usage guide.
  -e | --edit    <FILENAME>           Open a specific note for editing.
  -p | --print                        Print the contents of a note.
  -c | --create                       Create a note but don't open it.
  -n | --name    <FILENAME>           Use a specific filename rather than the
                                      default name (\$YEAR-\$MONTH-\$DAY.md).
                                      Can be combined with args (-c, -p, -t).
  -t | --time                         Add a timestamp when opening a note.
  -d | --delete  <FILENAME>           Move a note to the trash directory.
       --destroy <FILENAME>           Permanently delete (rm) a note.

Notekeeper loads configuration variables from:
\$HOME/.config/notekeeper/noterc.

For more help, see: https://github.com/dcchambers/note-keeper\n"
}

open_note() {
    printf "Opening note: %s\n" "$1"
    if [[ $EDITOR = *"vim"* ]] || [[ $EDITOR = *"nvim"* ]]; then
        # Open Vim or Neovim in insert mode.
        $EDITOR "+normal G$" +startinsert! "$1"
    elif [[ $EDITOR = *"emacs"* ]]; then
        # Open Emacs with cursor at EOF.
        emacs -nw "$1" --eval "(goto-char (point-max))"
    elif [[ $EDITOR = "" ]]; then
        # If no default editor, use Vim and open in insert mode.
        vim "+normal G$" +startinsert! "$1"
    else
        $EDITOR "$1"
    fi
}

edit_note() {
    # If find returns more than 1 result or no results (1 blank char) then
    # we return an error.
    path_to_note=$(find "$BASE_NOTE_DIR" -name "$1")
    if [ "$(echo "$path_to_note" | wc -l)" -gt 1 ]; then
        printf "Error: More than one note with that name was found.\n"
        printf "Please edit note(s) manually with your editor of choice.\n\n"
        printf "Files found:\n\n%s\n" "$path_to_note"
        exit 1
    elif [ "$path_to_note" = "" ]; then
        printf "Unable to find a note with that name in %s.\n" "$BASE_NOTE_DIR"
        exit 1
    else
        open_note "$path_to_note"
    fi
}

soft_delete_note() {
    if [ ! -d "$BASE_NOTE_DIR/trash" ]; then
        mkdir -p "$BASE_NOTE_DIR/trash"
    fi

    # If find returns more than 1 result or no results (1 blank char) then
    # we return an error and exit.
    path_to_note=$(find "$BASE_NOTE_DIR" -name "$1")
    if [ "$(echo "$path_to_note" | wc -l)" -gt 1 ]; then
        printf "Error: More than one note with that name was found.\n"
        printf "Please edit note(s) manually with your editor of choice.\n\n"
        printf "Files found:\n\n%s\n" "$path_to_note"
        exit 1
    elif [ "$path_to_note" = "" ]; then
        printf "Unable to find a note with that name in %s.\n" "$BASE_NOTE_DIR"
        exit 1
    else
        printf "Moving %s to trash.\n" "$path_to_note"
        mv -n "$path_to_note" "$BASE_NOTE_DIR/trash"
        exit 0
    fi

}

destroy_note() {
    # If find returns more than 1 result or no results (1 blank char) then
    # we return an error and exit.
    path_to_note=$(find "$BASE_NOTE_DIR" -name "$1")
    if [ "$(echo "$path_to_note" | wc -l)" -gt 1 ]; then
        printf "Error: More than one note with that name was found.\n"
        printf "Please edit note(s) manually with your editor of choice.\n\n"
        printf "Files found:\n\n%s\n" "$path_to_note"
        exit 1
    elif [ "$path_to_note" = "" ]; then
        printf "Unable to find a note with that name in %s.\n" "$BASE_NOTE_DIR"
        exit 1
    else
        printf "Permanently deleting %s.\n" "$path_to_note"
        rm -i "$path_to_note"
        exit 0
    fi
}

openNote=false
printNoteOnly=false
createNoteOnly=false

if (($# > 0)); then
    while [[ $# -gt 0 ]]; do
        key="$1"
        case $key in
        -e | --edit)
            if [ "$#" -ne 2 ]; then
                printf "Incorrect number of arguments.\n"
                printf "Usage: note --edit <FILENAME>\n"
                exit 1
            fi
            NOTE_NAME="$2"
            if [ -z "$NOTE_NAME" ]; then
                printf "Expected additional argument <Note Filename>.\n"
                exit 1
            else
                edit_note "$NOTE_NAME"
            fi
            exit 0
            ;;
        -p | --print)
            printNoteOnly=true
            shift
            ;;
        -c | --create)
            createNoteOnly=true
            shift
            ;;
        -n | --name)
            NOTE_NAME="$2"
            openNote=true
            if [ -z "$NOTE_NAME" ]; then
                printf "Expected additional argument <Note Filename>.\n"
                exit 1
            fi
            shift
            shift
            ;;
        -h | --help)
            print_help
            exit 0
            ;;
        -t | --time)
            addTimeStamp=true
            openNote=true
            shift
            ;;
        -d | --delete)
            if [ "$#" -ne 2 ]; then
                printf "Incorrect number of arguments.\n"
                printf "Usage: note --delete <FILENAME>\n"
                exit 1
            fi
            soft_delete_note "$2"
            exit 0
            ;;
        --destroy)
            if [ "$#" -ne 2 ]; then
                printf "Incorrect number of arguments.\n"
                printf "Usage: note --destroy <FILENAME>\n"
                exit 1
            fi
            destroy_note "$2"
            exit 0
            ;;
        *)
            printf "Unknown Argument \"%s\"\n" "$1"
            printf "Use \"note --help\" to see usage information.\n"
            exit 1
            ;;
        esac
    done
else
    #no arguments/options, just open the default note.
    openNote=true
fi

if [ "$printNoteOnly" = true ]; then
    if [ ! -f "$NOTE_DIR/$NOTE_NAME" ]; then
      printf "Unable to find a note to print in directory: %s\n" "$NOTE_DIR"
      exit 1
    fi
    $PRINT_TOOL "$NOTE_DIR/$NOTE_NAME"
    exit 0
fi

if [ "$createNoteOnly" = true ]; then
    create_note
    exit 0
fi

if [ "$addTimeStamp" = true ]; then
    printf "[%s]\n" "$(date +%T)" >> "$NOTE_DIR/$NOTE_NAME"
fi

if [ "$openNote" = true ]; then
    create_note
    open_note "$NOTE_DIR/$NOTE_NAME"
fi
