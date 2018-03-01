#!/bin/sh
IMGFILE=$(ls -- *.img)
IMGNAME=$(basename "$IMGFILE" .img)
split -a 1 -b 10m "$IMGFILE" "$IMGNAME".
rm "$IMGFILE"
