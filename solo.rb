mydir = File.dirname(__FILE__)

file_cache_path '/tmp/chef-solo'

cookbook_path [
  "#{mydir}/cookbooks",
  "#{mydir}/site-cookbooks"
]

minimal_ohai true
