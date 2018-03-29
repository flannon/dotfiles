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
  package { 'dep':       ensure => latest, }
  # see https://github.com/go-delve/homebrew-delve/issues/19#issuecomment-330442033
  # run ~/Library/Caches/Homebrew/delve-?.?.?/scripts/gencert.sh
  # and enter your pasword to enable delve
  # then go-delve/delve/delve will work.
  package { 'go-delve/delve/delve':       ensure => latest, }
  package { 'dnsmasq':   ensure => latest, }
  package { 'docker-machine': ensure => latest, }
  package { 'dynamodb-local': ensure => latest, }
  package { 'git':     ensure        => latest, }
  package { 'gnupg2':  ensure        => latest, }
  package { 'go':      ensure        => latest, }
  package { 'gotags':  ensure        => latest, }
  package { 'gradle':  ensure        => latest, }
  package { 'groovy':  ensure        => latest, }
  package { 'htop':    ensure        => latest, }
  package { 'hub':     ensure        => latest, }
  package { 'jenv':    ensure        => latest, }
  package { 'jq':      ensure        => latest, }
  package { 'lua':     ensure        => latest, }
  package { 'macvim':     ensure     => latest, }
  package { 'makedepend': ensure     => latest, }
  package { 'maven':      ensure     => latest, }
  package { 'mongodb':    ensure     => latest, }
  package { 'mysql':      ensure     => latest, }
  package { 'node':       ensure     => latest, }
  package { 'openssl':    ensure     => latest, }
  package { 'packer':     ensure     => latest, }
  package { 'pkg-config': ensure     => latest, }
  package { 'pyenv':      ensure     => latest, }
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
  package { 'terraform':  ensure => present, }
  package { 'wget':       ensure => latest, }

  # brewcask provider
  package { 'java':    ensure => present, provider => 'brewcask', }
  #package { 'kap':     ensure => present, provider => 'brewcask', }
  package { 'vagrant': ensure => latest,  provider => 'brewcask', }
    
  # Gem provider
  package { 'metadata-json-lint': ensure => latest, provider => 'gem', }
  package { 'semantic_puppet':    ensure => latest, provider => 'gem', }

  # Atom

  $atom_ensure = latest

  package { 'atom': ensure => $atom_ensure, provider => 'brewcask', }
  
  package { 'atom-bash-snippets': ensure => $atom_ensure, provider => apm, }
  package { 'atom-json': ensure => $atom_ensure, provider => apm, }
  package { 'atom-go-jump-test': ensure => $atom_ensure, provider => apm, }
  package { 'atom-go-get': ensure => $atom_ensure, provider => apm, }
  package { 'atom-gist-dev': ensure => $atom_ensure, provider     => apm, }
  package { 'atom-beautify': ensure => absent, provider     => apm, }
  package { 'atom-runner': ensure => absent, provider       => apm, }
  package { 'aligner-golang': ensure => $atom_ensure, provider    => apm, }
  package { 'autocomplete-json': ensure => $atom_ensure, provider => apm, }
  package { 'busy-signal': ensure => $atom_ensure, provider       => apm, }
  package { 'color-picker': ensure => $atom_ensure, provider      => apm, }
  package { 'declarations': ensure => $atom_ensure, provider      => apm, }
  package { 'file-icons': ensure => $atom_ensure, provider        => apm, }
  package { 'fonts': ensure => $atom_ensure, provider   => apm, }
  package { 'formatter-gofmt': ensure => $atom_ensure, provider   => apm, }
  package { 'git-diff': ensure => $atom_ensure, provider           => apm, }
  package { 'git-gui': ensure => $atom_ensure, provider           => apm, }
  package { 'git-plus': ensure => $atom_ensure, provider          => apm, }
  package { 'git-plus-plus': ensure => $atom_ensure, provider    => apm, }
  package { 'go-plus': ensure => $atom_ensure, provider           => apm, }
  package { 'go-debug': ensure => $atom_ensure, provider          => apm, }
  package { 'go-impl': ensure => $atom_ensure, provider           => apm, }
  package { 'go-imports': ensure => $atom_ensure, provider           => apm, }
  package { 'go-rename': ensure => $atom_ensure, provider         => apm, }
  package { 'go-signature-statusbar': ensure => $atom_ensure, provider  => apm, }
  package { 'gotests': ensure => $atom_ensure, provider           => apm, }
  package { 'go-tip': ensure => $atom_ensure, provider            => apm, }
  package { 'go-types': ensure => $atom_ensure, provider          => apm, }
  package { 'hclfmt': ensure => $atom_ensure, provider => apm, }
  package { 'hyperclick': ensure => $atom_ensure, provider        => apm, }
  package { 'atom-ide-ui': ensure => $atom_ensure, provider        => apm, }
  package { 'ide-go': ensure => $atom_ensure, provider            => apm, }
  package { 'intentions': ensure => $atom_ensure, provider        => apm, }
  package { 'intentions-colorpicker': ensure => $atom_ensure, provider  => apm, }
  package { 'intentions-numbers': ensure => $atom_ensure, provider => apm, }
  package { 'json-converter': ensure => $atom_ensure, provider     => apm, }
  package { 'json-to-go-struct': ensure => $atom_ensure, provider  => apm, }
  package { 'language-ansible': ensure => $atom_ensure, provider   => apm, }
  package { 'last-cursor-position': ensure => $atom_ensure, provider => apm, }
  package { 'linter': ensure => $atom_ensure, provider             => apm, }
  package { 'linter-ui-default': ensure => $atom_ensure, provider  => apm, }
  package { 'linter-ansible-syntax': ensure => $atom_ensure, provider => apm, }
  package { 'linter-golinter': ensure => $atom_ensure, provider       => apm, }
  package { 'linter-gotype': ensure => $atom_ensure, provider         => apm, }
  package { 'linter-packer-validate': ensure => $atom_ensure, provider => apm, }
  package { 'linter-vagrant-validate': ensure => $atom_ensure, provider => apm, }
  package { 'linter-terraform-syntax': ensure => $atom_ensure, provider => apm, }
  package { 'language-puppet': ensure => $atom_ensure, provider    => apm, }
  package { 'pretty-json': ensure => $atom_ensure, provider       => apm, }
  package { 'platformio-ide-terminal': ensure => $atom_ensure, provider => apm, }
  package { 'script': ensure => $atom_ensure, provider => apm, }
  package { 'terraform-fmt': ensure => $atom_ensure, provider      => apm, }
  package { 'term3': ensure => $atom_ensure, provider      => apm, }
  package { 'you-complete-me': ensure => $atom_ensure, provider    => apm, }
  package { 'vim-mode-plus': ensure => $atom_ensure, provider       => apm, }
  package { 'ex-mode': ensure => $atom_ensure, provider       => apm, }
  
  # Atom Themes and syntax
  package { 'afterglow-monokai-syntax': ensure => absent, provider => apm, }
  package { 'atom-dark-fusion-syntax': ensure => absent, provider => apm, }
  package { 'base16-syntax': ensure => $atom_ensure, provider => apm, }
  package { 'base16-ocean-dark-spacegray': ensure => absent, provider => apm, }
  package { 'dark-pastel-eighties-syntax': ensure => absent, provider => apm, }
  package { 'dracula-theme': ensure => absent, provider => apm, }
  package { 'github-atom-dark-syntax': ensure => absent, provider => apm, }
  package { 'grayscale-syntax': ensure => absent, provider => apm, }
  package { 'immersive-nucleus-dark-ui': ensure => absent, provider => apm, }
  package { 'leche-syntax': ensure => absent, provider => apm, }
  package { 'monokai-seti': ensure => absent, provider      => apm, }
  package { 'null-syntax': ensure => absent, provider => apm, }
  package { 'one-dark-shade-ui': ensure => absent, provider => apm, }
  package { 'one-dark-matte-syntax': ensure => absent, provider => apm, }
  package { 'nucleus-dark-ui': ensure => absent, provider => apm, }
  package { 'spacegray-dark-neue-ui': ensure => absent, provider => apm, }
  package { 'spacegray-dark-neue-syntax': ensure => absent, provider => apm, }
  package { 'unite-ui': ensure => absent, provider => apm, }
  
}

