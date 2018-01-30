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
class vim (
  String $vim_user = $identity['user'],
  String $vim_home = "/Users/${vim_user}",
){
  notice ("The idenity user is: $vim_user")

  file_line { 'alias_vi' :
    ensure => present,
    path   => "${vim_home}/.bashrc",
    line   => 'alias vi=vim',
  }


}
