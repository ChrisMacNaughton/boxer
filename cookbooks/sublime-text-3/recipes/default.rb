#
# Cookbook:: sublime-text-3
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_repository 'st3' do
  uri        'http://ppa.launchpad.net/webupd8team/sublime-text-3/ubuntu'
  components ['main']
  key '7B2C3B0889BF5709A105D03AC2518248EEA14886'
end

apt_package 'sublime-text-installer'