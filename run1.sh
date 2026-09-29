#!/bin/bash

if [ -z "$1" ]; then
  echo "Erreur : argument manquant."
  exit 1
fi

#tool=dot
tool=neato
$tool -Tpng $1.dot >$1.png
$tool -Tsvg $1.dot >$1.svg
