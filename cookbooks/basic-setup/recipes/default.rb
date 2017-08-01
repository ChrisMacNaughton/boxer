#
# Cookbook:: basic-setup
# Recipe:: default
#
# Copyright:: 2017, Chris MacNaughton, All Rights Reserved.

user_name = "chris"

user user_name do
  home "/home/#{user_name}"
  shell '/bin/bash'
end

['bin', '.ssh', 'projects'].each do |dir|
    directory "/home/#{user_name}/#{dir}" do
        recursive true
        owner user_name
        group user_name
        mode '0755'
        action :create
    end
end

remote_file "/home/#{user_name}/bin/sensible.bash" do
    source 'https://raw.githubusercontent.com/mrzool/bash-sensible/master/sensible.bash'
    owner user_name
    group user_name
    mode '0655'
    action :create
end

# Setup my bashrc
cookbook_file "/home/#{user_name}/.bashrc" do
  owner user_name
  group user_name
  source "bashrc"
end

# Setup my bashrc
cookbook_file "/home/#{user_name}/.gitconfig" do
  owner user_name
  group user_name
  source "gitconfig"
end

# all package to install
scm = %w{bzr git}
testing = %w{python-tox}
messaging = %w{telegram-desktop}
networking = %w{network-manager-openvpn-gnome sshuttle}
gpg_tools = %w{scdaemon pcscd pcsc-tools}
desktop_utils = %w{gnome-tweak-tool}

utils = [scm, testing, gpg_tools, networking, messaging, desktop_utils].flatten

utils.each do |util|
  package util
end

file "home/#{user_name}/bin/git_wrapper.sh" do
    owner "#{user_name}"
    mode "0755"
    content "#!/bin/sh\nexec /usr/bin/ssh -i /home/#{user_name}/.ssh/id_rsa -i /home/#{user_name}/.ssh/id_ed25519 \"$@\""
end

include_recipe 'basic-setup::repos'