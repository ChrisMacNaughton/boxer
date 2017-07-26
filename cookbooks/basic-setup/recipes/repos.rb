user_name = "chris"

# Git projects to keep in sync
projects = [
    ['ChrisMacNaughton','boxer'],
]

projects.each do |user, project|
    git "/home/#{user_name}/projects/#{project}" do
        user user_name
        group user_name
        checkout_branch 'master'
        enable_checkout false
        enable_submodules true
        repository "git@github.com:#{user}/#{project}.git"
        ssh_wrapper "/home/#{user_name}/bin/git_wrapper.sh"
        action :sync
    end
end

include_recipe 'basic-setup::juju'