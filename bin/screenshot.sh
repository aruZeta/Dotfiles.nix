#!/bin/sh

FILE_NAME="$(date +%a-%d-%b-%Y_%H-%M-%S).png"

grim -g "$(slurp)" \
     -t png \
     $HOME/Archive/Images/SS/$FILE_NAME
