#!/usr/bin/env bash

echo "installing apt-get packages"
sudo bash -c 'grep -v "^#" $HOME/dot-files/package_list.ubuntu | xargs -t -I {} sudo apt-get -y install {}' vim/bundle/

echo "updating vim plugins"
git submodule init
# update submodules to latest stuff
git submodule update --remote --merge --recursive

echo "linking dots"
$HOME/dot-files/links.sh


