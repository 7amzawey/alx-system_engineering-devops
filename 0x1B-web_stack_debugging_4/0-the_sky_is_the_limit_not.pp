# fix the error in the limit of the server

exec {'modify the default file in nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx && sudo service nginx restart',
  path    => '/bin:/usr/bin:/sbin:/usr/sbin',
}
