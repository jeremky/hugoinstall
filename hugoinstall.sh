#!/bin/bash
set -e

# Vérification de l'architecture
if [[ "$(uname -m)" = "aarch64" ]]; then
  arch=arm64
else
  arch=amd64
fi

# Téléchargement et installation
mkdir -p ~/.local/bin
curl -LO https://github.com/gohugoio/hugo/releases/download/v0.145.0/hugo_extended_0.145.0_linux-$arch.tar.gz
tar -C ~/.local/bin -xzf hugo_extended_0.145.0_linux-$arch.tar.gz
rm hugo_extended_0.145.0_linux-$arch.tar.gz
rm ~/.local/bin/LICENSE
rm ~/.local/bin/README.md
