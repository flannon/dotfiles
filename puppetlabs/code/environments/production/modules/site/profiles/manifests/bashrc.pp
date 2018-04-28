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

  notice("Configuring .bashrc for ${identity['user']}")
  File {
    group => 'staff',
    owner => $identity['user'],
  }

  # set up .bashrc
  $bashrc = "/Users/${identity['user']}/.bashrc"
  concat  { $bashrc :
    owner   => $identity['user]'],
    group   => staff,
    mode    => '0644',
    replace => true,
  }
  concat::fragment{ 'bashrc_preamble':
    target => $bashrc,
    source => "puppet:///modules/profiles/bashrc_preamble",
    order  => '01',
  }
  concat::fragment{ 'bashrc_defaults':
    target => $bashrc,
    source => "puppet:///modules/profiles/bashrc_default_aliases",
    order  => '02',
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
  #concat::fragment { 'bashrc_docker' :
  #  target => $bashrc,
  #  source => "puppet:///modules/profiles/bashrc_docker_conf",
  #  order  => '20',
  #}
  concat::fragment { 'bashrc_vbox' :
    target => $bashrc,
    source => "puppet:///modules/profiles/bashrc_vbox_aliases",
    order  => '25',
  }
  concat::fragment { 'bashrc_env_vars' :
    target => $bashrc,
    source => "puppet:///modules/profiles/bashrc_env_vars",
    order  => '30',
  }
  concat::fragment { 'bashrc_path' :
    target => $bashrc,
    source => "puppet:///modules/profiles/bashrc_path_and_evals",
    order  => '30',
  }

}
