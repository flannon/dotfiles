#!/bin/bash

set -e

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

# Link to self if it doesn't exist
[[ ! -f ~/bin/dotbuild ]] && ln -s $FULL_PATH ~/bin/dotbuild

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

[[ -L ${HOME}/.puppetlabs ]] && unlink ${HOME}/.puppetlabs
if [[ -d ${HOME}/.puppetlabs ]]; then
  echo "${HOME}/.puppetlabs is a directory!!!"
  echo "Exiting..."
  exit 2
fi
[[ ! -d ${HOME}/.puppetlabs ]] && ln -s ${SOURCE}/puppetlabs \
                                  ${HOME}/.puppetlabs
  
if [[ $(command -v puppet) ]]; then

  # Run puppet
  BASEDIR=${HOME}/.puppetlabs
  CONFDIR=${BASEDIR}/etc/puppet
  CODEDIR=${BASEDIR}/etc/code
  ENVIRONMENTPATH=${CODEDIR}/environments
  ENVIRONMENT=production
  MODULEPATH=${ENVIRONMENTPATH}/${ENVIRONMENT}/modules/site:${ENVIRONMENTPATH}/${ENVIRONMENT}/modules/local:${ENVIRONMENTPATH}/${ENVIRONMENT}/modules/thirdparty
  MANIFEST=${ENVIRONMENTPATH}/${ENVIRONMENT}/manifests/default.pp
  #MANIFEST=${HOME}/.puppetlabs/etc/code/environments/production/manifests/default.pp

  cd ${ENVIRONMENTPATH}/${ENVIRONMENT}
  r10k puppetfile install --moduledir modules/thirdparty
  cd $OLDPWD

  #puppet apply --confdir=$CONFDIR --codedir=$CODEDIR --environmentpath=$ENVIRONMENTPATH --modulepath=$MODULEPATH $MANIFEST
  puppet apply --modulepath=$MODULEPATH $MANIFEST

fi

# Load vim plugins
vim +PluginInstall +qall

# set vim as the git editor
git config --global core.editor $(which vim)
