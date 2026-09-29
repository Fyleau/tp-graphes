#!/bin/bash

if [ -z "$1" ]; then
  echo "Erreur : argument manquant (nom du fichier sans extension attendu)."
  exit 1
fi

tool=dot
$tool -Tpng "$1.dot" > "$1.png"
$tool -Tsvg "$1.dot" > "$1.svg"
