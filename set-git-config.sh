#!/bin/bash

git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global difftool.prompt false
git config --global alias.d difftool
