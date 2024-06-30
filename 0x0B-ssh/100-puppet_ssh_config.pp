#!/usr/bin/env bash
# Configures SSH client to use the private key ~/.ssh/school and refuse password authentication
exec {'ssh_command':
  command => 'echo "IdentityFile ~/.ssh/school" >> /etc/ssh/ssh_config;
  echo "PasswordAuthentication no" >> /etc/ssh/ssh_config'}
