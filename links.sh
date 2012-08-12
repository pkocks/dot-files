#!/usr/bin/env bash
#
cd $HOME
if [ -f .bashrc ] ; then mv -n .bashrc .bashrc-old ; fi
ln -Ffs dot-files/bashrc .bashrc

if [ -f .bash_profile ] ; then mv -n .bash_profile .bash_profile-old ; fi
ln -Ffs dot-files/bash_profile .bash_profile

if [ -f .gitignore_global ] ; then mv -n .gitignore_global .gitignore_global-old ; fi
ln -Ffs dot-files/gitignore_global .gitignore_global

if [ -f .vimrc ] ; then mv -n .vimrc .vimrc-old ; fi 
ln -Ffs dot-files/vimrc .vimrc 

if [ -d .vim ] ; then mv -n .vim .vim-old ; fi
ln -Ffs dot-files/vim .vim

if [ ! -d $HOME/tmp ] ; then mkdir $HOME/tmp ; fi 
if [ ! -d $HOME/tmp/.vim ] ; then mkdir $HOME/tmp/.vim ; fi
if [ ! -d $HOME/tmp/.vim/backup ] ; then mkdir $HOME/tmp/.vim/backup ; fi
if [ ! -d $HOME/tmp/.vim/tmp ] ; then mkdir $HOME/tmp/.vim/tmp ; fi
