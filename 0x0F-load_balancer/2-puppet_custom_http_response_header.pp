# this file is to make sure that this line is added to the config file
file_line { 'add_header':
  path => '/etc/nginx/sites-available/default',
  line => 'add_header X-Served-By $hostname;',
}

