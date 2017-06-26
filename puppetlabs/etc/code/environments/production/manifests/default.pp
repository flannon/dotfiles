node default {
  
  notice("NOTICE from the manifest file. user: ${identity['user']}")
  include roles::default
}

