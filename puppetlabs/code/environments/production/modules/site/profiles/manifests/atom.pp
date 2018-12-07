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
class profiles::atom(
  $atom_ensure = lookup('profiles::atom_ensure', String, 'first'),
){

  notice("Installing packages for ${identity['user']}")

  Package {
    provider => homebrew,
  }

  # Atom

  package { 'atom': ensure => $atom_ensure, provider => 'brewcask', }
  
  package { 'atom-bash-snippets':      ensure => $atom_ensure, provider => apm, }
  package { 'atom-clang':               ensure => $atom_ensure, provider => apm, }
  package { 'atom-json':               ensure => $atom_ensure, provider => apm, }
  package { 'atom-go-jump-test':       ensure => $atom_ensure, provider => apm, }
  package { 'atom-go-get':             ensure => $atom_ensure, provider => apm, }
  package { 'atom-gist-dev':           ensure => $atom_ensure, provider => apm, }
  package { 'atom-beautify':           ensure => absent, provider => apm, }
  package { 'atom-runner':             ensure => $atom_ensure, provider => apm, }
  package { 'aligner-golang':          ensure => $atom_ensure, provider => apm, }
  #package { 'autocomplete-clang':       ensure => $atom_ensure, provider => apm, }
  package { 'autocomplete-json':       ensure => $atom_ensure, provider => apm, }
  package { 'autocomplete-plus':       ensure => $atom_ensure, provider => apm, }
  package { 'block-select':             ensure => $atom_ensure, provider => apm, }
  package { 'build-cmake':             ensure => $atom_ensure, provider => apm, }
  package { 'busy-signal':             ensure => $atom_ensure, provider => apm, }
  package { 'color-picker':            ensure => $atom_ensure, provider => apm, }
  package { 'declarations':            ensure => $atom_ensure, provider => apm, }
  package { 'file-icons':              ensure => $atom_ensure, provider => apm, }
  package { 'fonts':                   ensure => $atom_ensure, provider => apm, }
  package { 'formatter-gofmt':         ensure => $atom_ensure, provider => apm, }
  package { 'git-gui':                 ensure => $atom_ensure, provider => apm, }
  package { 'git-plus':                ensure => $atom_ensure, provider => apm, }
  package { 'git-plus-plus':           ensure => absent, provider => apm, }
  package { 'go-plus':                 ensure => $atom_ensure, provider => apm, }
  package { 'go-debug':                ensure => $atom_ensure, provider => apm, }
  package { 'go-impl':                 ensure => $atom_ensure, provider => apm, }
  package { 'go-imports':              ensure => $atom_ensure, provider => apm, }
  package { 'go-rename':               ensure => $atom_ensure, provider => apm, }
  package { 'go-signature-statusbar' : ensure => $atom_ensure, provider => apm, }
  package { 'gotests':                 ensure => $atom_ensure, provider => apm, }
  package { 'go-tip':                  ensure => $atom_ensure, provider => apm, }
  package { 'go-types':                ensure => $atom_ensure, provider => apm, }
  package { 'gpp-compiler':                ensure => $atom_ensure, provider => apm, }
  package { 'hclfmt':                  ensure => $atom_ensure, provider => apm, }
  package { 'hyperclick':              ensure => $atom_ensure, provider => apm, }
  package { 'atom-ide-ui':             ensure => $atom_ensure, provider => apm, }
  package { 'ide-cpp':                  ensure => $atom_ensure, provider => apm, }
  package { 'ide-go':                  ensure => $atom_ensure, provider => apm, }
  package { 'ide-python':              ensure => absent, provider => apm, }
  package { 'intentions':              ensure => $atom_ensure, provider => apm, }
  package { 'intentions-colorpicker':  ensure => $atom_ensure, provider => apm, }
  package { 'intentions-numbers':      ensure => $atom_ensure, provider => apm, }
  package { 'json-converter':          ensure => $atom_ensure, provider => apm, }
  package { 'json-to-go-struct':       ensure => $atom_ensure, provider => apm, }
  package { 'language-ansible':        ensure => $atom_ensure, provider => apm, }
  package { 'language-cpp14':        ensure => $atom_ensure, provider => apm, }
  package { 'language-puppet':         ensure => $atom_ensure, provider => apm, }
  package { 'last-cursor-position':    ensure => $atom_ensure, provider => apm, }
  package { 'linter':                  ensure => absent, provider => apm, }
  package { 'linter-ui-default':       ensure => absent, provider => apm, }
  package { 'linter-ansible-syntax':   ensure => absent, provider => apm, }
  package { 'linter-golinter':         ensure => absent, provider => apm, }
  package { 'linter-gotype':           ensure => absent, provider => apm, }
  package { 'linter-packer-validate':  ensure => absent, provider => apm, }
  package { 'linter-vagrant-validate': ensure => absent, provider => apm, }
  package { 'linter-terraform-syntax': ensure => absent, provider => apm, }
  package { 'pretty-json':             ensure => $atom_ensure, provider => apm, }
  package { 'platformio-ide-terminal': ensure => $atom_ensure, provider => apm, }
  package { 'script':                  ensure => $atom_ensure, provider => apm, }
  package { 'terraform-fmt':           ensure => $atom_ensure, provider => apm, }
  package { 'term3':                   ensure => $atom_ensure, provider => apm, }
  package { 'you-complete-me':         ensure => absent, provider => apm, }
  package { 'vim-mode-plus':           ensure => $atom_ensure, provider => apm, }
  package { 'ex-mode':                 ensure => $atom_ensure, provider => apm, }
  
  # Atom Themes and syntax
  package { 'base16-syntax':           ensure => $atom_ensure, provider => apm, }
}

