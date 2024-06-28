# Install Flask from pip3
package { 'flask==2.1.0':
  ensure   => install,
  provider => 'pip3',
}
