resource_name :symlink_dotfile

property :source, :kind_of => String, :name_property => true
property :location, :kind_of => String

default_action :create

def target_location
   ::File.join(node['home'], location || source)
end

action :create do
  include_recipe 'dotfiles'
  directory ::File.dirname(target_location) do
    user node['user']
  end
  link target_location do
    to "#{node['dotfiles_clone']}/#{source}"
    user node['user']
  end
end

action :delete do
  link target_location do
    action :delete
  end
end
