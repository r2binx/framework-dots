#!/bin/sh

if (( $# == 0 )); then
    printf "Selection needed, see \`-h\` for help"
    exit 1
fi

FILE=~/Pictures/Screenshots/"screenshot-$(date +"%Y-%m-%dT%H:%M:%S").png"

SELECTION=''
while getopts ':cowah' flag; do
    case "${flag}" in
        c) SELECTION='active' ;;
        o) SELECTION='output' ;;
        w) SELECTION='window' ;;
        a) SELECTION='area' ;;
        h)
            printf "Add flag to select a target:\n\`-c\` - active window\n\`-o\` - active output\n\`-w\` - select window\n\`-a\` - select area"
            exit 1
            ;;
        *)
            printf "Invalid argument, see \`-h\` for help"
            exit 1
            ;;
    esac
done

grimshot --notify save $SELECTION "$FILE" && wl-copy < "$FILE"
