#! /usr/bin/env bash

sudo updatedb
cd $HOME
rm tags
locate '*\.py' | xargs /dnanexus/dot-files/bin/ptags.py
