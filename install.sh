#!/usr/bin/env bash

echo "installing apt-get packages"
sudo bash -c 'grep -v "^#" $HOME/dot-files/package_list.ubuntu | xargs -t -I {} sudo apt-get -y install {}' vim/bundle/

echo "updating vim plugins"
git submodule init
git submodule update

echo "linking dots"
$HOME/dot-files/links.sh


