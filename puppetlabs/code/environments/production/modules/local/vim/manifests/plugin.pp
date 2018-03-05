#
define vim::plugin (
  String $plugin = $title,
  String $vim_group = 'staff',
  String $vimuser = $identity['user'],
  String $home_dir = "/Users/${vimuser}",
){

  notice("From the defined type: $title")
  file_line { "$title" :
    ensure => present,
    path   => "${home_dir}/.vimrc",
    #path   => "/tmp/vimrc",
    line   => "Plugin \'${title}\'",
    after  => "^Plugin \'gmarik/Vundle.vim\'"
  }
}
