#!/bin/bash

set -e

#SOURCE=${HOME}/$(dirname $0)

case $(dirname $0) in
  '.')
    echo "dirname: $(dirname $0)"
    SOURCE=$(pwd)
      ;;
  *)
    echo "dirname: $(dirname $0)"
    SOURCE=${HOME}/$(dirname $0)
      ;;
esac

# Load submodules
cd $SOURCE
git submodule update --init --recursive
cd -

# Link vim
if [[ ! -f ${HOME}/.vimrc ]] || [[ ! -d ${HOME}/.vim ]]
then
  echo "Linking vim"
  ln -s $SOURCE/vimrc $HOME/.vimrc
  ln -s $SOURCE/vim $HOME/.vim
fi

vim +PluginInstall +qall

