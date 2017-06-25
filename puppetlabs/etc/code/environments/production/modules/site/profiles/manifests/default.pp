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
class profiles::default {

  notice("NOTICE from the proifle. USER: ${identity['user']}")

  
  File {
    group => 'staff',
    owner => $identity['user'],
  }
  
  Package {
    provider => homebrew,
  }

  ##

  #notice("NOTICE from profile::${identity['user']}")
  package { 'wget': ensure => present, }

  $bashrc = "/Users/${identity['user']}/.bashrc"
  concat  { $bashrc :
    owner   => kenny,
    group   => staff,
    mode    => '0644',
    replace => true,
  }
  concat::fragment{ 'bashrc_defaults':
    target => $bashrc,
    source => "puppet:///modules/profiles/bashrc_default_aliases",
    order  => '01',
  }
  concat::fragment { 'bashrc_aws' :
    target => $bashrc,
    source => "puppet:///modules/profiles/bashrc_aws_aliases",
    order  => '05',
  }
  concat::fragment { 'bashrc_dlib' :
    target => $bashrc,
    source => "puppet:///modules/profiles/bashrc_dlib_aliases",
    order  => '15',
  }
  concat::fragment { 'bashrc_docker' :
    target => $bashrc,
    source => "puppet:///modules/profiles/bashrc_docker_conf",
    order  => '20',
  }
  concat::fragment { 'bashrc_vbox' :
    target => $bashrc,
    source => "puppet:///modules/profiles/bashrc_vbox_aliases",
    order  => '25',
  }
  concat::fragment { 'bashrc_path' :
    target => $bashrc,
    source => "puppet:///modules/profiles/bashrc_path_and_evals",
    order  => '30',
  }
}
