#!/bin/bash

SRC="images"
DST_THUMB="thumbs"

find "$SRC" -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) | while read -r f; do
  rel="${f#$SRC/}"
  out="${rel}.webp"

  thumb_out="$DST_THUMB/$out"

  if  [ ! -f "$thumb_out" ] || [ "$f" -nt "$thumb_out" ]; then
    echo "convert: $f"

    mkdir -p "$(dirname "$thumb_out")"

    convert "$f" -auto-orient -resize 2000x2000\> -quality 80 "$thumb_out"
  fi
done
