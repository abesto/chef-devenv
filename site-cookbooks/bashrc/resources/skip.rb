property :flavor, :kind_of => String, :required => true
property :priority, :kind_of => Integer, :required => true

default_action :create

action :create do
  dir = ::File.join(Dir.home(node['user']), ".bashrc-#{flavor}.skip")

  include_recipe 'bashrc'
  bashrc_flavor flavor

  directory dir do
    user node['user']
  end
  file ::File.join(dir, "#{priority}#{name}") do
    user node['user']
  end
end
