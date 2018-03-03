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
class profiles::packages {

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
  package { 'dep':      ensure => latest, }
  package { 'dnsmasq':   ensure => latest, }
  package { 'docker-machine': ensure => latest, }
  package { 'dynamodb-local': ensure => latest, }
  package { 'git':     ensure => latest, }
  package { 'gnupg2':  ensure => latest, }
  package { 'go':      ensure => latest, }
  package { 'gradle':  ensure => latest, }
  package { 'groovy':  ensure => latest, }
  package { 'htop':    ensure => latest, }
  package { 'hub':     ensure => latest, }
  package { 'jenv':    ensure => latest, }
  package { 'jq':      ensure => latest, }
  package { 'lua':     ensure => latest, }
  package { 'macvim':     ensure => latest, }
  package { 'makedepend': ensure => latest, }
  package { 'maven':      ensure => latest, }
  package { 'mongodb':    ensure => latest, }
  package { 'mysql':      ensure => latest, }
  package { 'node':       ensure => latest, }
  package { 'openssl':    ensure => latest, }
  package { 'packer':     ensure => latest, }
  package { 'pkg-config': ensure => latest, }
  package { 'pyenv':      ensure => latest, }
  # pyenv-pip-reshash requires brew boneyard
  #package { 'pyenv-pip-rehash': ensure => latest, }
  package { 'pyenv-virtualenv': ensure => latest, }
  package { 'python':     ensure => latest, }
  package { 'python3':    ensure => latest, }
  package { 'rbenv':      ensure => latest, }
  package { 'readline':   ensure => latest, }
  package { 'ruby':       ensure => latest, }
  package { 'ruby-build': ensure => latest, }
  package { 'sqlite':     ensure => present, }
  package { 'terraform':   ensure => present, }
  #package { 'vim':        ensure => present, }
  package { 'wget':       ensure => latest, }
  # brewcask provider
  package { 'java':    ensure => present, provider => 'brewcask', }
  package { 'vagrant': ensure => latest,  provider => 'brewcask', }
    
  # Atom
  package { 'atom': ensure => present, provider => 'brewcask', }
  #
  package { 'atom-json': ensure => latest, provider => apm, }
  package { 'atom-go-jump-test': ensure => latest, provider => apm, }
  package { 'atom-gist-dev': ensure => latest, provider => apm, }
  package { 'aligner-golang': ensure => latest, provider => apm, }
  package { 'autocomplete-json': ensure => latest, provider => apm, }
  package { 'busy-signal': ensure => latest, provider => apm, }
  package { 'color-picker': ensure => latest, provider => apm, }
  package { 'declarations': ensure => latest, provider => apm, }
  package { 'formatter-gofmt': ensure => latest, provider => apm, }
  package { 'git-gui': ensure => latest, provider => apm, }
  #package { 'git-plus-plus': ensure => latest, provider => apm, }
  package { 'git-plus': ensure => latest, provider => apm, }
  package { 'go-debug': ensure => latest, provider => apm, }
  package { 'go-impl': ensure => latest, provider => apm, }
  package { 'go-plus': ensure => latest, provider => apm, }
  package { 'go-signature-statusbar': ensure => latest, provider => apm, }
  package { 'gotests': ensure => latest, provider => apm, }
  package { 'go-tip': ensure => latest, provider => apm, }
  package { 'go-types': ensure => latest, provider => apm, }
  package { 'hclfmt': ensure => latest, provider => apm, }
  package { 'hyperclick': ensure => latest, provider => apm, }
  package { 'ide-go': ensure => latest, provider => apm, }
  package { 'intentions': ensure => latest, provider => apm, }
  package { 'intentions-colorpicker': ensure => latest, provider => apm, }
  package { 'intentions-numbers': ensure => latest, provider => apm, }
  package { 'json-converter': ensure => latest, provider => apm, }
  package { 'json-to-go-struct': ensure => latest, provider => apm, }
  package { 'language-ansible': ensure => latest, provider => apm, }
  package { 'linter': ensure => latest, provider => apm, }
  package { 'linter-ui-default': ensure => latest, provider => apm, }
  package { 'linter-ansible-syntax': ensure => latest, provider => apm, }
  package { 'linter-golinter': ensure => latest, provider => apm, }
  package { 'linter-gotype': ensure => latest, provider => apm, }
  package { 'linter-packer-validate': ensure => latest, provider => apm, }
  package { 'linter-vagrant-validate': ensure => latest, provider => apm, }
  package { 'linter-terraform-syntax': ensure => latest, provider => apm, }
  package { 'language-puppet': ensure => latest, provider => apm, }
  package { 'monokai-seti': ensure => latest, provider => apm, }
  package { 'pretty-json': ensure => present, provider => apm, }
  package { 'terraform-fmt': ensure => present, provider => apm, }
  package { 'you-complete-me': ensure => present, provider => apm, }
  package { 'vim-mode-plus': ensure => latest, provider => apm, }
}
