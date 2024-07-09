# Ensure Nginx package is installed
package { 'nginx':
  ensure => installed,
}

# Ensure Nginx service is running and enabled at boot
service { 'nginx':
  ensure    => running,
  enable    => true,
  require   => Package['nginx'],
  subscribe => File['/etc/nginx/sites-available/default'],
}

# Ensure /var/www/html directory exists with correct permissions
file { '/var/www/html':
  ensure => directory,
  owner  => 'www-data',  # Use string 'www-data' instead of bare word www-data
  group  => 'www-data',  # Use string 'www-data' instead of bare word www-data
  mode   => '0755',
}

# Ensure /var/www/html/index.html file exists with content "Hello World!"
file { '/var/www/html/index.html':
  ensure  => file,  # Use => instead of >=
  content => 'Hello World!',  # Use => instead of >=
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0644',
  require => File['/var/www/html'],  # Use => instead of >=
}

# Ensure /etc/nginx/sites-available/default file exists with specified template content
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('nginx/default.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Allow Nginx HTTP service through the firewall if not already allowed
exec { 'allow-nginx-http':
  command => '/usr/sbin/ufw allow "Nginx HTTP"',
  unless  => '/usr/sbin/ufw status | grep "Nginx HTTP"',
  require => Package['nginx'],
}
