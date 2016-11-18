resource_name :symlink_dotfile

property :source, :kind_of => String, :name_property => true
property :location, :kind_of => String

default_action :create

def target_location
   ::File.join(node['home'], location || source)
end

action :create do
  include_recipe 'dotfiles'

  # Create target directory, and chown it to the user, along with its and parent dirs, up to the home dir
  dir = target_location
  while dir != node['home']
    dir = ::File.dirname(dir)
    directory dir do
      owner node['user']
      recursive true
    end
  end

  # Then create the symlink
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
