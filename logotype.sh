#!/bin/bash


if [ $# -ne 3 ]
then
    echo "usage: logotype.sh [color] [hex] [font]"
    echo
    echo "  Makes the Meta Tooth LLC logotype."
    exit
fi

color=$1
hex=$2
font=$3

./metalogo.sh 75 0.95 45 $hex ffffff > logo.svg

convert logo.svg logo.png

convert -fill $color -stroke $color -font $font-Regular -pointsize 200 label:Meta meta.png
convert -fill $color -stroke $color -font $font-Bold -pointsize 200 label:tooth tooth.png

convert -size 50x80 canvas:white spacer.png

convert -size 75x80 canvas:white top.png

convert -append top.png logo.png padded-logo.png

convert +append spacer.png meta.png tooth.png padded-logo.png spacer.png temp.png

convert temp.png -transparent white metatooth.png
