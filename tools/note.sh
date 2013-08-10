#!/bin/sh

# note.sh (~/.tools/note.sh)

# Setup
NOTES_PATH="$HOME/Dropbox/Dokument/Anteckningar"
NOTES_EXTENSION="txt"
NOTES_EDITOR="vim"
LS_SETTINGS="-c"
GREP_SETTINGS="--color"

# Create
note() {
  $NOTES_EDITOR ${NOTES_PATH}/"$*".${NOTES_EXTENSION}
}

# List/search
notes() {
  if [ -z $* ]; then
    cd $NOTES_PATH && ls $LS_SETTINGS
  else
    cd $NOTES_PATH && grep $GREP_SETTINGS "$*" *.${NOTES_EXTENSION}
  fi
}
