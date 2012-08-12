#!/usr/bin/env bash

echo "installing apt-get packages"
sudo bash -c 'grep -v "^#" $HOME/dot-files/package_list.ubuntu | xargs -t -I {} sudo apt-get -y install {}' vim/bundle/

echo "configuring vim"
$HOME/dot-files/vim/update_bundles.rb

echo "linking dots"
$HOME/dot-files/links.sh


