# execute a command to kill a process named kill me now
exec { 'killmenow_process':
  command     => '/usr/bin/pkill -f killmenow',
  path        => '/usr/bin',
  refreshonly => true,
}
