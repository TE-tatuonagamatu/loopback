#!/bin/sh
IMGFILE=$(ls -- *.img)
IMGNAME=$(basename "$IMGFILE" .img)
split -a 3 -b 10m "$IMGFILE" "$IMGNAME".
rm "$IMGFILE"
