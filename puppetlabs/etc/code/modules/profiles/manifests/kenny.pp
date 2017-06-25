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
class profiles::kenny {
  
  notice("NOTICE from the proifle.")

  class bashrc {
    #$bashrc = "/home/${user}/.bashrc"
    #$bashrc = "/tmp/${user}.bashrc"
    $bashrc = "/tmp/kenny.bashrc"

    concat  { $bashrc :
      owner => kenny,
      group => kenny,
      mode  => '0644',
    }

    concat::fragment{ 'bashrc_header':
      target => $bashrc,
      source => "puppet:///modules/profiles/bashrc_header.txt",
      order  => '01',
    }
    concat::fragment { 'bashrc_body' :
      target => $bashrc,
      source => "puppet:///modules/profiles/bashrc_body.txt",
      order  => '15',
    }
    concat::fragment { 'bashrc_footer' :
      target => $bashrc,
      source => "puppet:///modules/profiles/bachrc_footer.txt",
      order  => '30',
    }
  }
}
