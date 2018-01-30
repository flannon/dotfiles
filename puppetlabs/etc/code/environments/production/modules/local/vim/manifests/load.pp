# Class: vim
# ===========================
#
# Full description of class vim here.
#
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class vim::load(
  String $vim_user = $identity['user'],
  String $vim_home = "/Users/${vim_user}",
){

  file_line { 'alias_vi' :
    ensure => present,
    path   => "${vim_home}/.bashrc",
    line   => 'alias vi=vim',
  }

  #exec { 'PluginInstall' :
  #  command => '/usr/local/bin/vim +PluginInstall +qall 2>&1 1> /dev/null',
  #  path    => '/usr/local/bin',
  #}

  #exec { 'git_editory' :
  #  command => 'git config --global core.editor $(which vim)',
  #  path => [ "/usr/local/bin/git", "/usr/bin" ],
  #}

}
