name 'chrome'
maintainer 'Dennis Hoer'
maintainer_email 'dennis.hoer@gmail.com'
license 'MIT'
description 'Installs/Configures Chrome browser'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url 'https://github.com/dhoer/chef-chrome'
issues_url 'https://github.com/dhoer/chef-chrome/issues'
version '4.0.2'

chef_version '>= 12.14'

supports 'centos', '>= 7.0'
supports 'redhat', '>= 7.0'
supports 'fedora'
supports 'debian'
supports 'ubuntu'
supports 'windows'
