directory "#{node['home']}/.bashrc.d" do
  user node['user']
end

symlink_dotfile '.bashrc'
