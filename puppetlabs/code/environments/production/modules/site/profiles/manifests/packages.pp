# Class: profiles
# ===========================
#
# Full description of class profiles here.
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class profiles::packages{

  notice("Installing packages for ${identity['user']}")

  Package {
    provider => homebrew,
  }

  # ensure packages
  package { 'ant':       ensure => latest, }
  package { 'asciinema': ensure => latest, }
  package { 'autoconf':  ensure => latest, }
  package { 'cmake':     ensure => latest, }
  package { 'curl':      ensure => latest, }
  package { 'dep':       ensure => latest, }
  # see https://github.com/go-delve/homebrew-delve/issues/19#issuecomment-330442033
  # run ~/Library/Caches/Homebrew/delve-?.?.?/scripts/gencert.sh
  # and enter your pasword to enable delve
  # then go-delve/delve/delve will work.
  package { 'go-delve/delve/delve': ensure => latest, }
  package { 'dnsmasq':              ensure => latest, }
  package { 'docker-machine':       ensure => latest, }
  #package { 'dynamodb-local':       ensure => latest, }
  package { 'git':                  ensure => latest, }
  package { 'gnupg2':               ensure => latest, }
  package { 'go':                   ensure => latest, }
  package { 'gotags':               ensure => latest, }
  package { 'gradle':               ensure => latest, }
  package { 'groovy':               ensure => latest, }
  package { 'htop':                 ensure => latest, }
  package { 'hub':                  ensure => latest, }
  package { 'jenv':                 ensure => latest, }
  package { 'jq':                   ensure => latest, }
  package { 'lua':                  ensure => latest, }
  package { 'macvim':               ensure => latest, }
  package { 'makedepend':           ensure => latest, }
  package { 'maven':                ensure => latest, }
  package { 'mongodb':              ensure => latest, }
  package { 'mysql':                ensure => latest, }
  package { 'node':                 ensure => latest, }
  package { 'openssl':              ensure => latest, }
  package { 'packer':               ensure => latest, }
  package { 'pkg-config':           ensure => latest, }
  package { 'pyenv':                ensure => latest, }
  # pyenv-pip-reshash requires brew boneyard
  #package { 'pyenv-pip-rehash': ensure => latest, }
  package { 'pyenv-virtualenv':     ensure => latest, }
  package { 'python':               ensure => latest, }
  package { 'python2':              ensure => latest, }
  package { 'rbenv':                ensure => latest, }
  package { 'readline':             ensure => latest, }
  package { 'ruby':                 ensure => latest, }
  package { 'ruby-build':           ensure => latest, }
  package { 'sqlite':               ensure => present, }
  package { 'terraform':            ensure => present, }
  package { 'wget':                 ensure => latest, }

  # OpenCV requirments
  # needs `brew tap homebrew/science`
  package { 'opencv3':              ensure => latest, }
  package { 'ffmpeg':               ensure => latest, }
  package { 'jpeg':                 ensure => latest, }
  package { 'libtiff':              ensure => latest, }
  package { 'openxr':               ensure => latest, }
  package { 'numpy':                ensure => latest, }
  package { 'tbb':                  ensure => latest, }
  package { 'xz':                   ensure => latest, }
  
  # brewcask provider
  package { 'java':           ensure => present, provider => 'brewcask', }
  #package { 'kap':     ensure => present, provider => 'brewcask', }
  package { 'vagrant':        ensure => latest,  provider => 'brewcask', }
  package { 'dynamodb-local': ensure => latest,  provider => 'brewcask', }
    
  # Gem provider
  package { 'metadata-json-lint': ensure => latest, provider => 'gem', }
  package { 'semantic_puppet':    ensure => latest, provider => 'gem', }


 }
  
