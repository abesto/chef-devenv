directory "#{Dir.home(node['user'])}/.bashrc.d" do
  user node['user']
end

symlink_dotfile '.bashrc'
