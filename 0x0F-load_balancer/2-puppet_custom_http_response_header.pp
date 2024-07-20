# this file is to make sure that this line is added to the config file
package { 'nginx':
  ensure => installed,
}

service { 'nignx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

file_line { 'add_header':
  path => '/etc/nginx/sites-available/default',
  line => 'add_header X-Served-By $hostname;',
}

