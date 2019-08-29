#!/bin/bash


if [ $# -ne 2 ]
then
    echo "usage: slogan.sh [first] [second]"
    echo
    echo "  Makes a 600x600 and 150x400 slogan image."
    exit
fi

first=$1
second=$2

color=#ff33bb

convert -background $color -fill white -stroke white -font Ubuntu-Medium -pointsize 120 label:$first _first-120.png
convert -background $color -fill white -stroke white -font Ubuntu-Medium -pointsize 120 label:$second _second-120.png

convert +antialias -background $color -fill white -stroke white -font Ubuntu-Medium -pointsize 64 label:$first _first-64.png
convert +antialias -background $color -fill white -stroke white -font Ubuntu-Medium -pointsize 64 label:$second _second-64.png

{
    width=`identify _first-120.png | gawk '{ print $3 }' | gawk -Fx '{ print $1 }'`
    height=`identify _first-120.png | gawk '{ print $3 }' | gawk -Fx '{ print $2 }'`

    echo "First image is $width wide."
    echo "First image is $height high."

    spacer=$(( (600 - width)/2 ))

    echo "Need to makeup $spacer x $height"

    convert -size ${spacer}x${height} canvas:$color _first-spacer.png

    convert +append _first-spacer.png _first-120.png _first-spacer.png _first-row.png
}

{
    width=`identify _second-120.png | gawk '{ print $3 }' | gawk -Fx '{ print $1 }'`
    height=`identify _second-120.png | gawk '{ print $3 }' | gawk -Fx '{ print $2 }'`

    echo "Second image is $width wide."
    echo "Second image is $height high."

    spacer=$(( (600 - width)/2 ))

    echo "Need to makeup $spacer x $height"

    convert -size ${spacer}x${height} canvas:$color _second-spacer.png

    convert +append _second-spacer.png _second-120.png _second-spacer.png _second-row.png
}

vert=$(( (600-$height-$height)/2 ))

echo "Need $vert"

convert -size 600x${vert} canvas:$color _vert-spacer.png

convert -append _vert-spacer.png _first-row.png _second-row.png _vert-spacer.png $first-$second-600x600.png

{
    width=`identify _first-64.png | gawk '{ print $3 }' | gawk -Fx '{ print $1 }'`
    height=`identify _first-64.png | gawk '{ print $3 }' | gawk -Fx '{ print $2 }'`

    echo "First 64 is ${width} wide."
    echo "First 64 line is ${height} high."

    convert -size 16x${height} canvas:$color _word_spacer.png

    convert +append _first-64.png _word_spacer.png _second-64.png _single_row.png
}

{
    width=`identify _single_row.png | gawk '{ print $3 }' | gawk -Fx '{ print $1 }'`
    height=`identify _single_row.png | gawk '{ print $3 }' | gawk -Fx '{ print $2 }'`

    echo "Single line image is $width wide."
    echo "Single line image is $height high."

    spacer=$(( (400 - width)/2 ))

    echo "Need to makeup $spacer x $height"

    convert -size ${spacer}x${height} canvas:$color _third-spacer-left.png

    convert +append _third-spacer-left.png _single_row.png _full-line-a.png

    width=`identify _full-line-a.png | gawk '{ print $3 }' | gawk -Fx '{ print $1 }'`

    echo "Single line image is $width wide."
    spacer=$(( 400 - ${width} ))
    
    convert -size ${spacer}x${height} canvas:$color _third-spacer-right.png

    convert +append _full-line-a.png _third-spacer-right.png _full-line.png
}

vert=$(( (150-$height)/2 ))

convert -size 400x${vert} canvas:$color _vert-padding.png

convert -append _vert-padding.png _full-line.png _vert-padding.png $first-$second-150x400.png

rm _*.png
