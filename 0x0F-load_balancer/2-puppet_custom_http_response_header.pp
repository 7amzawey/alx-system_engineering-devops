# Install Nginx
package { 'nginx':
  ensure => installed,
}

# Ensure the Nginx service is running and enabled
service { 'nginx':
  ensure     => running,
  enable     => true,
  require    => Package['nginx'],
}

# Ensure the custom header line is present in the Nginx configuration
file_line { 'add_header':
  path  => '/etc/nginx/sites-available/default',
  line  => 'add_header X-Served-By $hostname;',
  match => 'add_header X-Served-By',
  notify => Service['nginx'],
}

# Reload Nginx to apply changes
exec { 'reload_nginx':
  command     => '/usr/sbin/nginx -s reload',
  refreshonly => true,
  subscribe   => File_line['add_header'],
}

