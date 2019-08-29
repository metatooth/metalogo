#!/bin/bash


if [ $# -ne 1 ]
then
    echo "usage: logotype.sh [color]"
    echo
    echo "  Makes the Meta Tooth LLC logotype."
    exit
fi

color=$1

./metalogo.sh 75 0.95 45 $color white > logo.svg

convert logo.svg logo.png

convert -fill $color -stroke $color -font GaramondNo8-Regular -pointsize 200 label:Meta meta.png
convert -fill $color -stroke $color -font GaramondNo8-Medium -pointsize 200 label:tooth tooth.png

convert -size 50x80 canvas:white spacer.png

convert -size 75x80 canvas:white top.png

convert -append top.png logo.png padded-logo.png

convert +append spacer.png meta.png tooth.png padded-logo.png spacer.png temp.png

convert temp.png -transparent white metatooth.png
