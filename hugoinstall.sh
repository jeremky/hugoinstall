#!/bin/bash -e

# Vérification de l'architecture
if [[ "$(uname -m)" = "aarch64" ]]; then
  arch=arm64
else
  arch=amd64
fi

# Téléchargement et installation
version=$(curl -s -L -o /dev/null -w '%{url_effective}' https://github.com/gohugoio/hugo/releases/latest | sed 's#.*/tag/v##')
mkdir -p ~/.local/bin
curl -LOs https://github.com/gohugoio/hugo/releases/download/v"$version"/hugo_extended_"$version"_linux-"$arch".tar.gz
tar -C ~/.local/bin -xzf hugo_extended_"$version"_linux-"$arch".tar.gz
rm hugo_extended_"$version"_linux-"$arch".tar.gz ~/.local/bin/LICENSE ~/.local/bin/README.md
echo "Installation de hugo terminée"
