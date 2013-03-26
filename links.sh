#!/usr/bin/env bash
#
cd $HOME

if [ -f .vimrc ] ; then mv -n .vimrc .vimrc-old ; fi 
ln -Ffs dot-files/vimrc .vimrc 

if [ -f .gvimrc ] ; then mv -n .gvimrc .gvimrc-old ; fi 
ln -Ffs dot-files/gvimrc .gvimrc 

if [ -d .vim ] ; then mv -n .vim .vim-old ; fi
ln -Ffs dot-files/vim .vim

if [ ! -d $HOME/tmp ] ; then mkdir $HOME/tmp ; fi 
if [ ! -d $HOME/tmp/.vim ] ; then mkdir $HOME/tmp/.vim ; fi
if [ ! -d $HOME/tmp/.vim/backup ] ; then mkdir $HOME/tmp/.vim/backup ; fi
if [ ! -d $HOME/tmp/.vim/tmp ] ; then mkdir $HOME/tmp/.vim/tmp ; fi
