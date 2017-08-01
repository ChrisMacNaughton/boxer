#
# Cookbook:: sublime-text-3
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_repository 'spotify' do
  uri        'http://repository.spotify.com'
  components ['non-free']
  distribution 'stable'
  key 'BBEBDCB318AD50EC6865090613B00F1FD2C19886'
end

apt_package 'spotify-client'