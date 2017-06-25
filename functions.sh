# This ones cool, but doesn't work in my shell
#cd^ ()
#{
#  if [[ $1 -eq 1 ]]; then
#    cd ..;
#  else
#    cd $(seq -f "../" -s '' $1) 2>/dev/null;
#  fi;
#  return 0
#}

gitroot() {
  cd "$(git rev-parse --show-toplevel)"
}
