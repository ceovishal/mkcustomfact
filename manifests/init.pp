# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mkcustomfact::transfer_file
class mkcustomfact {
  if $::osfamily == 'windows' {
    file { 'example.txt':
      ensure => present,
      source => 'puppet:///modules/mkcustomfact/example.txt',
      path   => 'C:\example.txt',
    }
  }

  $testhost = find_file('/etc/hosts')
  notify {"Host file is in [${testhost}]":}
  $loclscript = find_file('/usr/local/bin/elastic_agent_install.sh')
  notify {"Local script exists in [${loclscript}] with side helping of [${testhost}]":}

  file { '/tmp/check/elastic_agent_install.sh':
    ensure => 'present',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }
}
