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


  #if $facts['system_profiler']['model_name'] == 'MacBook Pro' {
  #  alert("system-profiler.model_name--:  ${facts['system_profiler']['model_name']}")
  #}

  case $facts['system_profiler']['model_name'] {
    'MacBook Pro' :  { 
      alert("model_name:  ${facts['system_profiler']['model_name']}")
      $minishift_cpus = 2
      $minishift_memory = 4096
      $minishift_vm_driver = "virtualbox"
      $minishift_disk_size = "20GB"
      alert("cpus, $minishift_cpus, memory, $minishift_memory, vm-driver, $minishift_vm_driver")
    }
    'Mac Pro' :  { 
      alert("case: model name is ${facts['system_profiler']['model_name']}, os.family is ${os['family']}")
      $minishift_cpus = 8
      $minishift_memory = 8192
      $minishift_vm_driver = "virtualbox"
      $minishift_disk_size = "40GB"
      alert("cpus, $minishift_cpus, memory, $minishift_memory, vm-driver, $minishift_vm_driver")
    
    }
    default :           { alert("$facts['os']['name'] not supported for minishift at this time") }
  }


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

  # concat fragments for .bashrc - depricated
  #concat  { $bashrc :
  #  owner   => $identity['user]'],
  #  group   => staff,
  #  mode    => '0644',
  #  replace => true,
  #}
  #concat::fragment{ 'bashrc_preamble':
  #  target => $bashrc,
  #  source => "puppet:///modules/profiles/bashrc_preamble",
  #  order  => '01',
  #}
  #concat::fragment{ 'bashrc_defaults':
  #  target => $bashrc,
  #  source => "puppet:///modules/profiles/bashrc_default_aliases",
  #  order  => '02',
  #}
  #concat::fragment { 'bashrc_aws' :
  #  target => $bashrc,
  #  source => "puppet:///modules/profiles/bashrc_aws_aliases",
  #  order  => '05',
  #}
  #concat::fragment { 'bashrc_dlib' :
  #  target => $bashrc,
  #  source => "puppet:///modules/profiles/bashrc_dlib_aliases",
  #  order  => '15',
  #}
  ##concat::fragment { 'bashrc_docker' :
  ##  target => $bashrc,
  ##  source => "puppet:///modules/profiles/bashrc_docker_conf",
  ##  order  => '20',
  ##}
  #concat::fragment { 'bashrc_vbox' :
  #  target => $bashrc,
  #  source => "puppet:///modules/profiles/bashrc_vbox_aliases",
  #  order  => '25',
  #}
  #concat::fragment { 'bashrc_env_vars' :
  #  target => $bashrc,
  #  source => "puppet:///modules/profiles/bashrc_env_vars",
  #  order  => '30',
  #}
  #concat::fragment { 'bashrc_path' :
  #  target => $bashrc,
  #  source => "puppet:///modules/profiles/bashrc_path_and_evals",
  #  order  => '31',
  #}
  #concat::fragment { 'bashrc_pyenv' :
  #  target => $bashrc,
  #  source => "puppet:///modules/profiles/bashrc_pyenv",
  #  order  => '99',
  #}

}
