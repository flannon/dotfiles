#
define vim::plugin (
  String $plugin = $title,
  String $vim_group = 'staff',
  String $vim_user = $identity['user'],
  String $home_dir = "/Users/${vim_user}",
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
