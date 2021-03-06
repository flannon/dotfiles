#!/bin/bash


usage () {
cat << EOF
Usage:    
	toolbox_config [ control | $USER ]
EOF
}

echo $1
[[ -z $1 ]] && usage && exit 1
[[ $1 != "control" ]] && [[ $1 != $USER ]] && usage && exit 1
#[[ ( $1 != "control" ) || ( $1 != $USER ) ]] && usage && exit 1
[[ $1 == "control" ]] && PLAYBOOK=$1 
[[ $1 == $USER ]] && PLAYBOOK="user" 
curl 169.254.169.254/0.1/meta-data/service-accounts 2>&1 | grep googleapis 2>&1 1>/dev/null
[[ $? == 0 ]] && PLAYBOOK="gcp"
echo $PLAYBOOK

#echo HERE
#CONTAINER=$1
DIRNAME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"

#  Must be run as none priviledged user
abort() { echo -e "${RED}$* ${NC}" >&2 && exit 1; }
[[ $USER == "root" ]] && abort \
   "Can't be run as root, must be run as $SUDO_USER."

echo $PLAYBOOK

HOSTNAME=$(hostname)
# configure control
if [[ $HOSTNAME == "toolbox" ]]; then
  cd ${DIRNAME}/ansible
  ansible-galaxy install -r requirements.yml
  ansible-playbook -e user=${USER} -i ./inventory playbooks/${PLAYBOOK}.yml
  cd -
fi

# Is is google
curl 169.254.169.254/0.1/meta-data/service-accounts 2>&1 | grep googleapis 2>&1 1>/dev/null
if [[ $? == 0 ]]; then
  cd ${DIRNAME}/ansible
  ansible-galaxy install -r requirements.yml
  ansible-playbook -e user=${USER} -i ./inventory playbooks/${PLAYBOOK}.yml
  cd -
fi
