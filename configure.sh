#!/bin/bash

set -e

SOURCE=${HOME}/$(dirname $0)


if [[ ! -f ${HOME}/.vimrc ]] || [[ ! -d ${HOME}/.vim ]]
then
  echo "Linking vim"
  ln -s $SOURCE/vimrc $HOME/.vimrc
  ln -s $SOURCE/vim $HOME/.vim
fi
