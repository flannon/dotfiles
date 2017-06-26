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
class profiles::vim {
  notice("Configuring vim and vundle for ${identity['user']}")


  File {
    group => 'staff',
    owner => $identity['user'],
  }

  $bashrc = "/Users/${identity['user']}/.bashrc"
  concat::fragment { 'bashrc_vim_alias' :
    target  => $bashrc,
    #content => "\nalias vi=/usr/local/bin/vim\n",
    content => "\nalias vi=vim\n",
    order   => '01',
  }

}
