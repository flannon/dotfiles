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
class profiles::bashrc {

  #notice("Configuring .bashrc for ${identity['user']}")
  alert("Configuring .bashrc for ${identity['user']}")


  File {
    group => 'staff',
    owner => $identity['user'],
  }

  # set up .bashrc
  $bashrc = "/Users/${identity['user']}/.bashrc"
  file { $bashrc :
    ensure  => file,
    mode    => '0600',
    content => template("profiles/bashrc.erb"),
  }

}
