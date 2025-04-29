# hugoinstall

Ce script permet l'installation de [Hugo](https://gohugo.io/) dans sa dernière version sur un système Debian et dérivé. Il est compatible x64 et arm64.

## Installation

```bash
git clone https://github.com/jeremky/hugoinstall
cd hugoinstall
./hugoinstall.sh
```

Le binaire sera installé ici : `~/.local/bin/hugo`. Il vous sera nécessaire de redémarrer votre session afin qu'il soit chargé par la variable `PATH`.

## Vérification

Pour vérifier la bonne installation, exécutez la commande suivante : 

```bash
hugo version
```

## Désinstallation

Si vous souhaitez supprimer Hugo, il suffit de supprimer le binaire :

```bash
rm -f ~/.local/bin/hugo
```
