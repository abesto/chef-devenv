property :priority, :kind_of => Integer, :required => true
property :cookbook, :kind_of => String

default_action :create

action :create do
  include_recipe 'bashrc'

  _cookbook = cookbook
  _name = name
  cookbook_file ::File.join(Dir.home(node['user']), '.bashrc.d', "#{priority}#{name}") do
    source _name
    cookbook _cookbook
    user node['user']
  end
end
