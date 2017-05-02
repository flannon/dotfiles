#!/bin/bash

set -e

BIN=~/bin

case $(dirname $0) in
  '.')
    #echo "dirname: $(dirname $0)"
    SOURCE=$(pwd)
      ;;
  *)
    #echo "dirname: $(dirname $0)"
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
  if [[ ! -L ${HOME}/.vimrc ]] && [[ ! -f ${HOME}/.vimrc ]];
  then

    ln -s $SOURCE/vimrc $HOME/.vimrc
  fi

  if [[ ! -L ${HOME}/.vim ]] && [[ ! -d ${HOME}/.vim ]];
  then
    ln -s $SOURCE/vim $HOME/.vim
  fi
fi

vim +PluginInstall +qall

# setup ~/bin
if [[ ! -d $BIN ]];
then
  mkdir $BIN
fi

cd ${SOURCE}/bin


for i in $(ls);
do
  if [[ ! -L ${HOME}/bin/${i:0:${#i} -3} ]] && \
     [[ ! -f ${HOME}/bin/${i:0:${#i} -3} ]];
  then
    echo linking $i
    ln -s ${SOURCE}/bin/${i} ${HOME}/bin/${i:0:${#i} -3}
  fi
done

cd -

