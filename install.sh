#!/bin/sh

# Simple Install Script

curl -o /usr/local/bin/note https://raw.githubusercontent.com/dcchambers/note-keeper/master/note
chmod +x /usr/local/bin/note
echo "Note Keeper installed (/usr/local/bin/note)."
