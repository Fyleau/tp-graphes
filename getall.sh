#!/bin/bash

tok=$(cat ~/token.gh)
OWNER="Fyleau"
REPO="tp-graphes"

echo "==> Récupération de la liste des artefacts..."
curl -s -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $tok" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$OWNER/$REPO/actions/artifacts > gh-artifacts.json

jq -r '.artifacts[].id' gh-artifacts.json > liste-id.txt

echo "==> Téléchargement des artefacts trouvés :"
while read -r id; do
  if [ -n "$id" ]; then
    echo "Téléchargement de l'artefact ID : $id"
    curl -s -L \
      -H "Accept: application/vnd.github+json" \
      -H "Authorization: Bearer $tok" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      https://api.github.com/repos/$OWNER/$REPO/actions/artifacts/$id/zip \
      --output "artifact-$id.zip"

    mkdir -p "extracted-$id"
    unzip -o -q "artifact-$id.zip" -d "extracted-$id"
  fi
done < liste-id.txt

echo "==> Téléchargement et extraction terminés avec succès."
