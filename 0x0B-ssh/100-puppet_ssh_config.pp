exec { 'configure_ssh_client':
  command => 'echo "PasswordAuthentication no" >> /etc/ssh/ssh_config,
   echo "IdentityFile ~/.ssh/school" >> /etc/ssh/ssh_config',
}
