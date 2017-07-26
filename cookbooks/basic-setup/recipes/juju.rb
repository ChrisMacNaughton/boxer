user_name = "chris"

['charms', 'layers'].each do |subdir|
    directory "/home/#{user_name}/projects/juju/#{subdir}" do
        user user_name
        group user_name
        recursive true
    end
end

openstack_charms = [
    'ceph',
    'ceph-mon',
    'ceph-osd',
    'cinder',
    'cinder-ceph',
    'glance',
    'lxd',
    'nova-compute',
    'nova-cloud-controller',
    'swift-proxy',
    'swift-storage',
]

openstack_charms.each do |charm|
    git "/home/#{user_name}/projects/juju/charms/#{charm}" do
        user user_name
        group user_name
        checkout_branch 'master'
        enable_checkout false
        enable_submodules true
        repository "https://github.com/openstack/charm-#{charm}.git"
        action :sync
    end
end