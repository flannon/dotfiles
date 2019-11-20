#!/bin/bash

PATH=$PATH:${HOME}/.local/bin
INSTALLDIR="${HOME}/.dotfiles"

# Set up authorized_keys for $USER
grep "${USER}ss\@" ~/.ssh/id_rsa.pub 2>&1 1>/dev/null
[[ -f ${HOME}/.ssh/id_rsa.pub && $? != 0 ]] && cat ${HOME}/.ssh/id_rsa.pub >> ${HOME}/.ssh/authorized_keys
[[ -f ${HOME}/.ssh/authorized_keys ]] && chmod 644 ${HOME}/.ssh/authorized_keys

stat_container () {
	container=$1
	toolbox list --containers | awk 'NR>2 { print $2 }'   \
	  | grep ${container} 2>&1 1> /dev/null
}

mktoolbox () {
  c=$1
  echo $c
  stat_container $c
  [[ $? != 0 ]] && toolbox create --container $c || echo Container $c exists && return 0
  which ansible 
  [[ $? != 0 ]] && toolbox run --container $c bash -c "python3 -m pip install ansible --user"
  toolbox run --container $c bash -c "cd ${INSTALLDIR}/ansible && \
  	${HOME}/.local/bin/ansible-galaxy install -r requirements.yml"
  wait
  toolbox run --container $c bash -c "cd ${INSTALLDIR}/ansible && \
  	${HOME}/.local/bin/ansible-playbook -vvv -e user=${USER} -i ./inventory playbooks/$c.yml"
  wait 
}

mktoolbox $USER
#mktoolbox control


