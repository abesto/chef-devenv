directory "#{Dir.home(node['user'])}/.tmux/plugins" do
  user node['user']
  recursive true
end

git "#{Dir.home(node['user'])}/.tmux/plugins/tpm" do
  repository 'https://github.com/tmux-plugins/tpm'
  user node['user']
end

symlink_dotfile '.tmux.conf'
