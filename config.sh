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
PATH=$PATH:${HOME}/.local/bin
INSTALLDIR="${HOME}/.dotfiles"

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
[[ ! -d $BIN ]] && mkdir $BIN

# link binaries
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
cd $OLDPWD

# Set up authorized_keys for $USER
grep "${USER}ss\@" ~/.ssh/id_rsa.pub 2>&1 1>/dev/null
[[ -f ${HOME}/.ssh/id_rsa.pub && $? != 0 ]] && cat ${HOME}/.ssh/id_rsa.pub >> ${HOME}/.ssh/authorized_keys
[[ -f ${HOME}/.ssh/authorized_keys ]] && chmod 644 ${HOME}/.ssh/authorized_keys

# Set up controler and $USER containers
stat_container () {
	container=$1
	toolbox list --containers | awk '{ print $2 }' |  \
	  grep -v ID |  grep -v created | grep ${container} \
	  2>&1 1> /dev/null
}

c=$USER
echo $c
stat_container $c
[[ $? != 0 ]] && toolbox create --container $c 
toolbox run --container $c bash -c "python3 -m pip install ansible --user"
#toolbox run --container $c bash -c "sudo dnf install -y ansible"
toolbox run --container $c bash -c "cd ${INSTALLDIR}/ansible && \
	${HOME}/.local/bin/ansible-galaxy install -r requirements.yml"
toolbox run --container $c bash -c "cd ${INSTALLDIR}/ansible && \
	${HOME}/.local/bin/ansible-playbook -vvvv -e user=${USER} -i ./inventory playbooks/user.yml"

c="control"
stat_container $c
[[ $? != 0 ]] && toolbox create --container $c
toolbox run --container $c bash -c "python3 -m pip install ansible --user"
#toolbox run --container $c bash -c "sudo dnf install -y ansible python2 python2-pip"
toolbox run --container $c bash -c "cd ${INSTALLDIR}/ansible && \
	${HOME}/.local/bin/ansible-galaxy install -r requirements.yml"
toolbox run --container $c bash -c "cd ${INSTALLDIR}/ansible && \
	${HOME}/.local/bin/ansible-playbook -e user=${USER} -i ./inventory playbooks/control.yml"

