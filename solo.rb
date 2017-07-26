root = File.expand_path(File.dirname(__FILE__))

file_cache_path '/tmp/' + root
node_path '/tmp/' + root + '/nodes'
cookbook_path [
    root + "/berks-cookbooks",
    root + "/cookbooks",
]