#
# Cookbook:: rvm
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_repository 'st3' do
  uri        'ppa:rael-gc/rvm'
  components ['main']
end

apt_package 'rvm'