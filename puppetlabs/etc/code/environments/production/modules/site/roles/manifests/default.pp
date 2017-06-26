# Class: roles
# ===========================
#
# Full description of class roles here.
#
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class roles::default {

  include profiles::bashrc
  include profiles::packages

  Class['profiles::bashrc']->
  Class['profiles::packages']

}
