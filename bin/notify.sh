#!/bin/bash

PROG=`basename $0`
USAGE="Usage: $PROG [-h|?]
    [-f watch_dir]
    [-t to_dir]
    [-c cmd|ssh|scp|del|fdel]"

WATCH_DIR=""
DEST_DIR=""
CMD="ssh"

while getopts u:n:c:f:h opt
do
	case $opt in
		f) WATCH_DIR=$OPTARG;;
		t) DEST_DIR=$OPTARG;;
		c) CMD=$OPTARG;;
		\?|h) echo "$USAGE"; exit 1;;
		esac
  done

#inotifywait -mrq -e modify,delete,create,moved_to --format %w%f www  | while read file 
inotifywait -mrq -e create,move,delete,modify --format %w%f $WATCH_DIR | while read F
do
    echo "--------------"

    echo $F
done



