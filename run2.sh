#!/bin/bash

for a in *.dot; do
  echo "traitement du fichier $a"
  a2="${a%.*}"
  if [ "$a2" = "g4" ]; then
    neato -Tsvg "$a" > "$a2.svg"
  else
    dot -Tsvg "$a" > "$a2.svg"
  fi
done
