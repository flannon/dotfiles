#
define vim::vimrc (
  String $vimuser = $title,
  String $vim_group = 'staff',
  String $home_dir  = "/Users/${title}",
){

  notice("From the defined type: $title")

  $vimrc = "${home_dir}/.vimrc"
  concat { $vimrc :
    owner => $vim_user,
    group => $vim_group,
    mode    => '0644',
    replace => true,
  }
  concat::fragment{ 'vimrc_header':
    target => $vimrc,
    source => "puppet:///modules/vim/vimrc_header",
    order  => '01',
  }
  concat::fragment{ 'vimrc_colorscheme':
    target => $vimrc,
    source => "puppet:///modules/vim/vimrc_colorscheme",
    order  => '02',
  }
  concat::fragment{ 'vimrc_footer':
    target => $vimrc,
    source => "puppet:///modules/vim/vimrc_footer",
    order  => '03',
  }
    
}
