#!/bin/bash

tok=$(cat ~/token.gh)
OWNER="Fyleau"
REPO="tp-graphes"

# 1. Récupération des métadonnées des artefacts
curl -s -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $tok" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$OWNER/$REPO/actions/artifacts > gh-artifacts.json

# 2. Téléchargement direct du zip de l'artefact par son ID
curl -s -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $tok" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$OWNER/$REPO/actions/artifacts/11023356240/zip \
  --output artifact.zip

# 3. Extraction de l'archive
unzip -o artifact.zip
