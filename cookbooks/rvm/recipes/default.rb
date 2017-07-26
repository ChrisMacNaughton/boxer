#
# Cookbook:: rvm
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_repository 'rvm' do
  uri        'ppa:rael-gc/rvm'
  components ['main']
  distribution 'zesty'
end

apt_package 'rvm'