class transfer_file {
  file { 'example.txt':
    ensure => present,
    source => 'puppet:///modules/mkcustomfact/example.txt',
    path   => 'C:\example.txt',
  }
}
