#!/bin/bash

set -e

DIRNAME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.5.0/bin:$PATH"

BIN=~/bin
SUDO_USER=$(who am i | awk '{print $1}')
FULL_PATH="$(cd "$(dirname "$0")" && pwd)/$(basename "$0")"
SOURCE="$(cd "$(dirname "$0")" && pwd)"
RED="\033[1;31m" # Red
NC="\033[0m"     # No Color

abort() { echo -e "${RED}$* ${NC}" >&2 && exit 1; }
[[ $USER == "root" ]] && abort \
   "Can't be run as root, must be run as $SUDO_USER."

# Update submodules when there are changes
if [[ -f .gitmodules ]]; then
  # Load hooks 
  for i in $(ls ${SOURCE}/githooks)
  do
    if [[ ! -L ${SOURCE}/.git/hooks/${i} ]] &&
      [[ ! -f ${SOURCE}/.git/hooks/${i} ]]
    then
      ln -s ${SOURCE}/githooks/${i} ${SOURCE}/.git/hooks/${i}
    fi
  done

  # Load submodules
  cd $SOURCE
  git submodule update --init --recursive
  cd $OLDPWD

fi

# setup ~/bin
if [[ ! -d $BIN ]];
then
  mkdir $BIN
fi

cd ${SOURCE}/bin

# link binaries
for i in $(ls);
do
  if [[ ! -L ${HOME}/bin/${i:0:${#i} -3} ]] && \
     [[ ! -f ${HOME}/bin/${i:0:${#i} -3} ]];
  then
    echo linking $i
    ln -s ${SOURCE}/bin/${i} ${HOME}/bin/${i:0:${#i} -3}
  fi
done
cd $OLDPWD

# configure vim and vundle
[[ ! -d ${DIRNAME}/vim/bundle/Vundle.vim ]] && \
  git clone https://github.com/VundleVim/Vundle.vim.git && \
  ${DIRNAME}/vim/bundle/Vundle.vim

[[ ! -L ${HOME}/.vimrc ]] && ln -s ${DIRNAME}/vimrc ${HOME}/.vimrc
vim +PluginInstall +qall
# set vim as the git editor
#git config --global core.editor $(which vim)

# Add to ${HOME}/.bashrc
# [[ -f ${HOME}/.dotfiles/cloudbuildrc ]] && source ${HOME}/.dotfiles/cloudbuildrc
