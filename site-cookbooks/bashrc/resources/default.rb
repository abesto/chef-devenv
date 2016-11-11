property :priority, :kind_of => Integer, :required => true
property :cookbook, :kind_of => String
property :source, :kind_of => String, :default => lazy { |r| r.name }

default_action :create

action :create do
  include_recipe 'bashrc'

  _cookbook = cookbook
  _name = name
  _source = source
  cookbook_file ::File.join(node['home'], '.bashrc.d', "#{priority}#{name}") do
    source _name
    cookbook _cookbook
    source _source
    user node['user']
  end
end
