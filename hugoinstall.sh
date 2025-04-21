#!/bin/bash
set -e

# Vérification de l'architecture
if [[ "$(uname -m)" = "aarch64" ]]; then
  arch=arm64
else
  arch=amd64
fi

# Choix de la version
version=0.146.6

# Téléchargement et installation
mkdir -p ~/.local/bin
curl -LO https://github.com/gohugoio/hugo/releases/download/v"$version"/hugo_extended_"$version"_linux-"$arch".tar.gz
tar -C ~/.local/bin -xzf hugo_extended_"$version"_linux-"$arch".tar.gz
rm hugo_extended_"$version"_linux-"$arch".tar.gz
rm ~/.local/bin/LICENSE
rm ~/.local/bin/README.md
