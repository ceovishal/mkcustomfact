# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mkcustomfact::basicexec
class mkcustomfact::basicexec {
    exec { 'create_directory':
    path      => '/usr/bin:/usr/sbin:/bin',
    command   => '/bin/mkdir -p /tmp/testing/basic_exec',
    onlyif    => 'test ! -d /tmp/testing/basic_exec',
    schedule  => 'everyday',
  }

  schedule { 'everyday':
    period  => hourly,
    repeat  => 1,
  }
}
