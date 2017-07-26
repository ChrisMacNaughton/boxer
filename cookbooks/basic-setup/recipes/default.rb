#
# Cookbook:: basic-setup
# Recipe:: default
#
# Copyright:: 2017, Chris MacNaughton, All Rights Reserved.

include_recipe 'bazaar'

user = "chris"

['bin', '.ssh'].each do |dir|
    directory "/home/#{user}/#{dir}" do
        owner user
        group user
        mode '0755'
        action :create
    end
end

remote_file "/home/#{user}/bin/sensible.bash" do
  source 'https://raw.githubusercontent.com/mrzool/bash-sensible/master/sensible.bash'
  owner user
  group user
  mode '0655'
  action :create
end

# Setup my bashrc
cookbook_file "/home/#{user}/.bashrc" do
  owner user
  group user
  source "bashrc"
end

# Canonical sshebang config
bazaar 'sshebang' do
  source 'lp'  # defaults to 'lp' if you omit the source
  user 'chris.macnaughton'
  remote_path 'canonical-sshebang'
  local_path "/home/#{user}/.ssh"
end