mydir = File.dirname(__FILE__)

file_cache_path '/tmp/chef-solo'

cookbook_path [
  "#{mydir}/berks-cookbooks",
  "#{mydir}/site-cookbooks"
]

minimal_ohai true
