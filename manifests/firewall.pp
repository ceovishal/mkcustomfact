class mkcustomfact::firewall{
Firewall {
    require => undef,
  }

 ####
  # default IPv4 chains
  # filter table
  firewallchain { 'INPUT:filter:IPv4':   ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'FORWARD:filter:IPv4': ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'OUTPUT:filter:IPv4':  ensure => present, policy => 'accept', before => undef, }

  # mangle table
  firewallchain { 'PREROUTING:mangle:IPv4':  ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'INPUT:mangle:IPv4':       ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'FORWARD:mangle:IPv4':     ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'OUTPUT:mangle:IPv4':      ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'POSTROUTING:mangle:IPv4': ensure => present, policy => 'accept', before => undef, }

  # nat table
  firewallchain { 'PREROUTING:nat:IPv4':  ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'INPUT:nat:IPv4':       ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'OUTPUT:nat:IPv4':      ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'POSTROUTING:nat:IPv4': ensure => present, policy => 'accept', before => undef, }

  # raw table
  firewallchain { 'PREROUTING:raw:IPv4': ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'OUTPUT:raw:IPv4':     ensure => present, policy => 'accept', before => undef, }

  # security table
  firewallchain { 'INPUT:security:IPv4':   ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'FORWARD:security:IPv4': ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'OUTPUT:security:IPv4':  ensure => present, policy => 'accept', before => undef, }

  #custom 
  firewallchain { 'CUSTOMTEST:raw:IPv4': ensure => absent,  }
  firewallchain { 'CUSTOMSEC:security:IPv4':   ensure => absent,  }
  firewallchain { 'CUSTOMPREROUTING:nat:IPv4':  ensure => absent,  }
  firewallchain { 'CUSTOMPOSTROUTING:mangle:IPv4': ensure => absent,  }
  firewallchain { 'CUSTOMOUTPUT:filter:IPv4':  ensure => absent,  }

  ####
  # default IPv6 chains
  # filter table
  firewallchain { 'INPUT:filter:IPv6':   ensure => present, policy => 'drop', before => undef, }
  firewallchain { 'FORWARD:filter:IPv6': ensure => present, policy => 'drop', before => undef, }
  firewallchain { 'OUTPUT:filter:IPv6':  ensure => present, policy => 'drop', before => undef, }

  # mangle table
  firewallchain { 'PREROUTING:mangle:IPv6':  ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'INPUT:mangle:IPv6':       ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'FORWARD:mangle:IPv6':     ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'OUTPUT:mangle:IPv6':      ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'POSTROUTING:mangle:IPv6': ensure => present, policy => 'accept', before => undef, }

  # nat table
  firewallchain { 'PREROUTING:nat:IPv6':  ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'INPUT:nat:IPv6':       ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'OUTPUT:nat:IPv6':      ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'POSTROUTING:nat:IPv6': ensure => present, policy => 'accept', before => undef, }

  # raw table
  firewallchain { 'PREROUTING:raw:IPv6': ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'OUTPUT:raw:IPv6':     ensure => present, policy => 'accept', before => undef, }

  # security table
  firewallchain { 'INPUT:security:IPv6':   ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'FORWARD:security:IPv6': ensure => present, policy => 'accept', before => undef, }
  firewallchain { 'OUTPUT:security:IPv6':  ensure => present, policy => 'accept', before => undef, }
  
  #custom ipv6
  firewallchain { 'CUSTOMTEST:raw:IPv6': ensure => absent, }
  firewallchain { 'CUSTOMSEC:security:IPv6':   ensure => absent,  }
  firewallchain { 'CUSTOMPREROUTING:nat:IPv6':  ensure => absent,  }
  firewallchain { 'CUSTOMVISHALPOSTROUTING:mangle:IPv6': ensure => absent,  }
  firewallchain { 'CUSTOMSSSOUTPUT:filter:IPv6':  ensure => absent,  }


}

#include testfirewall
