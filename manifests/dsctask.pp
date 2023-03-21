# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mkcustomfact::basicexec
class mkcustomfact::dsctask {
    if $::osfamily == 'windows' {
        file { 'example.txt':
          ensure  => present,
          path    => "C:\\myfile.txt",
          content => 'Hello World',
        }

        dsc_scheduledtask { 'My Task':
          dsc_ensure           => 'Present',
          dsc_enable           => true,
          dsc_taskname         => 'my-task',
          #dsc_taskpath        => '\\DRDC',
          dsc_description      => 'Demo Task',
          dsc_actionexecutable => 'C:\\Windows\\System32\\cmd.exe',
          dsc_actionarguments  => '/C "echo Hello"',
          dsc_scheduletype     => 'Daily',
          dsc_starttime        => Timestamp('2011-08-31T01:45:00'),
          dsc_user             => 'SYSTEM',
          dsc_runlevel         => 'Highest',
          require              => File['My File'],
        }
    }
}
