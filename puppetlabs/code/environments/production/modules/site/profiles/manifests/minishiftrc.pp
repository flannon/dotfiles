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
class profiles::minishiftrc {

  #notice("Configuring .bashrc for ${identity['user']}")
  alert("Configuring .minikuberc for ${identity['user']}")



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



  # set up .minikuberc
  $minishiftrc = "/Users/${identity['user']}/.minishiftrc"
  file { $minishiftrc :
    ensure  => file,
    mode    => '0600',
    content => template("profiles/minishiftrc.erb"),
  }

}
