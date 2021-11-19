#!/bin/sh

FILE_NAME="$(date +%a-%d-%b-%Y_%H-%M-%S).png"
DIR="$(xdg-user-dir PICTURES)/SS"

grim -g "$(slurp)" \
     -t png \
     $DIR/$FILE_NAME
