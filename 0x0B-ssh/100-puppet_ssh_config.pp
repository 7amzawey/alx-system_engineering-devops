# Ensure SSH client configuration
file { '/home/user/.ssh/config':
  ensure  => present,
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode    => '0600',
  content => "
    Host remote-server
      HostName 54.161.240.181
      User ubuntu
      IdentityFile ~/.ssh/school
      PasswordAuthentication no
  ",
}
