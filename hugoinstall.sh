#!/bin/bash -e

# Messages colorisés
error()    { echo -e "\033[0;31m====> $*\033[0m" ;}
message()  { echo -e "\033[0;32m====> $*\033[0m" ;}
warning()  { echo -e "\033[0;33m====> $*\033[0m" ;}

# Vérification de l'architecture
if [[ "$(uname -m)" = "aarch64" ]]; then
  arch=arm64
else
  arch=amd64
fi

# Dernière version
version=$(curl -s -L -o /dev/null -w '%{url_effective}' https://github.com/gohugoio/hugo/releases/latest | sed 's#.*/tag/v##')

gethugo() {
  mkdir -p ~/.local/bin
  warning "Téléchargement de Hugo v$version..."
  curl -LOs https://github.com/gohugoio/hugo/releases/download/v"$version"/hugo_extended_"$version"_linux-"$arch".tar.gz
  if [[ -f hugo_extended_"$version"_linux-"$arch".tar.gz ]]; then
    tar -C ~/.local/bin -xzf hugo_extended_"$version"_linux-"$arch".tar.gz
    rm hugo_extended_"$version"_linux-"$arch".tar.gz ~/.local/bin/LICENSE ~/.local/bin/README.md
    message "Installation terminée"
  else
    error "Problème de téléchargement de Hugo v$version"
    exit 1
  fi
}

# Téléchargement et installation
if [[ -f ~/.local/bin/hugo ]]; then
  locver=$(hugo version | awk '{print $2}' | cut -d- -f1 | cut -dv -f2)
  if [[ "$version" = "$locver" ]] ; then
    warning "Hugo est déjà installé dans sa dernière version : v$locver"
    exit 0
  else
    read -p "Nouvelle version disponible : v$version. Voulez-vous l'installer ? (o/n) : " reponse
    case $reponse in
      o|oui)
        gethugo
        ;;
      n|non)
        message "Installation annulée"
        exit 0
        ;;
    esac
  fi
else
  gethugo
fi
