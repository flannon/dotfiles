node default {
  
  notice("NOTICE from the manifest file. user: ${identity['user']}")
  include profiles::default
}

