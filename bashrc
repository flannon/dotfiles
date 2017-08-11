##
#  default aliases
##
alias c=clear
alias lo=exit
alias ls="ls -F"
alias rm="rm -i"
alias ssh="ssh -o VisualHostKey=yes"
#alias vi=/usr/local/bin/vim

set -o vi

##
#  AWS aliases
##
alias ec2-connect="ssh -i ~/.ssh/dlts-aws-flannon.pem"
alias ec2-scp="scp -i ~/.ssh/dlts-aws-flannon.pem"
alias cfn="aws cloudformation"
alias dynamodb="java -Djava.library.path=./DynamoDBLocal_lib -jar /usr/local/Cellar/dynamodb-local/2016-05-17/libexec/DynamoDBLocal.jar -sharedDb"
alias ec2-frankfurt="ssh -i ~/.ssh/dlts-aws-frankfurt-flannon.pem"

alias aspace-dev="ec2-connect ec2-user@aspace-dev-dc.dlts.org"
alias aspace-qa="ec2-connect ec2-user@aspace-qa.dlts.org"
alias aspace-combined="ec2-connect ec2-user@aspace-combined.dlts.org"
alias jenkins-dev="ec2-connect ec2-user@jenkins-dev.dlts.org"
alias nexus-dev="ec2-connect ec2-user@nexus-dev.dlts.org"

##
#  dlib aliases
##   
alias bastion="ssh -l jackson b.dlib.nyu.edu"
alias ca="ssh -l jackson ca.dlib.nyu.edu"
alias dev-ca="ssh -l jackson dev-ca.dlib.nyu.edu"
alias dev-discovery="ssh -l jackson dev-discovery.dlib.nyu.edu"
alias dev-dl-rs="ssh -l jackson dev-dl-rs.home.nyu.edu"
alias dev-dl-pa="ssh -l jackson dev-dl-pa.home.nyu.edu"
alias dev-ead="ssh -l jackson dev-ead-publisher.dlib.nyu.edu"
alias dl-img="ssh -l jackson dl-img.home.nyu.edu"
alias discovery="ssh -l jackson discovery.dlib.nyu.edu"
alias dl-pa="ssh -l jackson dl-pa.home.nyu.edu"
alias dl-rs="ssh -l jackson dl-rs.home.nyu.edu"
alias devhandle="ssh -l jackson devhandle.dlib.nyu.edu"
alias ead="ssh -l jackson ead-publisher.dlib.nyu.edu"
alias handle="ssh -l jackson handle.dlib.nyu.edu"
alias stage-dl-pa="ssh -l jackson stage-dl-pa.home.nyu.edu"
alias archive="ssh -l jackson archive.nyu.edu"
alias dlibprod="ssh -l jackson dlibprod.home.nyu.edu"
alias dlibtest="ssh -l jackson dlibtest.home.nyu.edu"
alias dlibdev="ssh -l jackson dlibdev.nyu.edu"
alias tlon="ssh -l jackson tlon.dlib.nyu.edu"
alias sites="ssh -l jackson sites.dlib.nyu.edu"
alias dev-sites="ssh -l jackson dev-sites.dlib.nyu.edu"
alias ead-publisher="ssh -l jackson ead-publisher.dlib.nyu.edu"
alias dev-ead-publisher="ssh -l jackson dev-ead-publisher.dlib.nyu.edu"
# Library IT aliases
alias v1="ssh -l fj5 variations1.bobst.nyu.edu"
alias v2="ssh -l fj5 variations2.bobst.nyu.edu"
# CCG aliases
alias akerman="ssh -l dlts dl-akerman.bobst.nyu.edu"
alias atkins="ssh -l dlts dl-atkins.bobst.nyu.edu"
alias lange="ssh -l dlts dl_lange.bobst.nyu.edu"
alias lippmann="ssh -l dlts dl-lippmann.bobst.nyu.edu"
alias marker="ssh -l dlts dl-marker.bobst.nyu.edu"
alias miller="ssh -l dlts dl-miller.bobst.nyu.edu"
alias nadar="ssh -l dlts dl-nadar.bobst.nyu.edu"
alias taro="ssh -l dlts dl-taro.bobst.nyu.edu"
alias pc01="ssh -l dlts dlts-pc01.bobst.nyu.edu"
# Preservation aliases
alias afc-macpro="ssh -l dlts afc-macpro.bobst.nyu.edu"
alias video-lab="ssh -l dlts video-lab.bobst.nyu.edu"
alias video-lab2="ssh -l dlts video2-lab.bobst.nyu.edu"

##
#  docker conf
##
alias dm=docker-machine
alias dmeval='eval "$(docker-machine env default)"'
export DMPID=$(ps augxww | grep -i vbox | grep default \
               | tr -s ' ' | cut -d ' ' -f 2)
if [[ ! -z $DMPID ]]; then
  #eval "$(docker-machine env default)"
  $(dmeval)
fi

##
#  vbox aliases
##
#alias vbox=VboxManage
alias vbox="/usr/bin/vboxmanage"

##
#  path and evals
##
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(pyenv virtualenv-init -)"

export GOPATH=$HOME/Documents/go
PATH=/usr/local/bin:/usr/local/sbin:$PATH:~/bin:.

PATH="/opt/puppetlabs/bin/:$PATH"

export PATH="$GOPATH/bin:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
alias vi=vim
