#!/bin/bash


if [ $# -ne 2 ]
then
    echo "usage: logotype.sh [color] [font]"
    echo
    echo "  Makes the Metatooth LLC logotype."
    exit
fi

color=$1
font=$2

./metalogo.sh 65 0.95 45 ${color:1} ffffff > logo.svg

convert logo.svg -background none logo.png

convert -fill $color -stroke $color -font $font -pointsize 200 label:Metatooth metatooth.png

convert -size 50x202 canvas:white spacer.png

convert -size 130x17 canvas:white top.png

convert -append top.png logo.png padded-logo.png

convert +append spacer.png metatooth.png padded-logo.png spacer.png temp.png

convert temp.png -transparent white metatooth.png
