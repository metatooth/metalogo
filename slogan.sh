#!/bin/bash


if [ $# -ne 2 ]
then
    echo "usage: slogan.sh [first] [second]"
    echo
    echo "  Makes a 600x600 slogan image."
    exit
fi

first=$1
second=$2

color=#ff33bb

convert -background $color -fill white -stroke white -font Ubuntu-Medium -pointsize 120 label:$first first.png
convert -background $color -fill white -stroke white -font Ubuntu-Medium -pointsize 120 label:$second second.png

{
    width=`identify first.png | gawk '{ print $3 }' | gawk -Fx '{ print $1 }'`
    height=`identify first.png | gawk '{ print $3 }' | gawk -Fx '{ print $2 }'`

    echo "First image is $width wide."
    echo "First image is $height high."

    spacer=$(( (600 - width)/2 ))

    echo "Need to makeup $spacer x $height"

    convert -size ${spacer}x${height} canvas:$color first-spacer.png

    convert +append first-spacer.png first.png first-spacer.png first-row.png
}

{
    width=`identify second.png | gawk '{ print $3 }' | gawk -Fx '{ print $1 }'`
    height=`identify second.png | gawk '{ print $3 }' | gawk -Fx '{ print $2 }'`

    echo "Second image is $width wide."
    echo "Second image is $height high."

    spacer=$(( (600 - width)/2 ))

    echo "Need to makeup $spacer x $height"

    convert -size ${spacer}x${height} canvas:$color second-spacer.png

    convert +append second-spacer.png second.png second-spacer.png second-row.png
}

vert=$(( (600-$height-$height)/2 ))

echo "Need $vert"

convert -size 600x${vert} canvas:$color vert-spacer.png

convert -append vert-spacer.png first-row.png second-row.png vert-spacer.png $first-$second.png
