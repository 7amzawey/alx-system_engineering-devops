# this manifest is for creating a file in /tmp
file { '/tmp/school':
  owner   => 'www-data',
  group   => 'www-data',
  content => 'I love Puppet',
  mode    => '0744',
}
