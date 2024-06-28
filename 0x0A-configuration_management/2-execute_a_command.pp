# execute a command to kill a process named kill me now
exec { '2-execute_a_command':
  command  => 'pkill killmenow',
  provider => 'shell',
}
