# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mkcustomfact::transfer_file
class mkcustomfact {
  if $::osfamily == 'windows' {
    file { 'example.txt':
      ensure  => present,
      source => 'puppet:///modules/mkcustomfact/example.txt',
      path   => 'C:\example.txt',
    }
  }
}
