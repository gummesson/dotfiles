#!/bin/bash

############
# FUNCTIONS
############

# NOTE-TAKING

# Open/create note
function no() {
geany ~/Dropbox/Dokument/Anteckningar/$1.txt 
}

# Search for a note (by last modified date)
function nos() {
ls -c ~/Dropbox/Dokument/Anteckningar | grep --color=always $1
}

# List all notes (by last modified date)
function nol() {
ls -c ~/Dropbox/Dokument/Anteckningar
}

# Display the note in the terminal
function not() {
  cat ~/Dropbox/Dokument/Anteckningar/$1.txt
}

# TODO

# Add a todo
function td() {
echo $@ >> ~/Dropbox/Dokument/Anteckningar/todo.txt
}

# Find a todo
function tdf() {
cat ~/Dropbox/Dokument/Anteckningar/todo.txt | grep --color=always $1
}

# THE SPARK FILE

# Add an item
function add() {
echo -e "\t- $@" >> ~/Dropbox/Dokument/Anteckningar/spark-file.txt
}

