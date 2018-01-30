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

  include vim
  vim::vimrc { "${identity['user']}" : }
  #vim::vimrc { "kenny" : }

  vim::plugin { "L9" :}
  vim::plugin { "Valloric/YouCompleteMe" : }
  vim::plugin { "hashivim/vim-vagrant" : }
  vim::plugin { "hashivim/vim-terraform" : }
  vim::plugin { "rodjek/vim-puppet" : }
  vim::plugin { "hashivim/vim-packer" : }
  vim::plugin { "fatih/vim-go" : }
  vim::plugin { "davidhalter/jedi-vim" : }
  vim::plugin { "Yggdroot/indentLine" : }
  vim::plugin { "tpope/vim-fugitive" : }
  vim::plugin { "flazz/vim-colorschemes" : }

}
  
