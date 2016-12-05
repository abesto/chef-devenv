directory "#{node['home']}/.tmux/plugins" do
  user node['user']
  recursive true
end

git "#{node['home']}/.tmux/plugins/tpm" do
  repository 'https://github.com/tmux-plugins/tpm'
  user node['user']
end

symlink_dotfile '.tmux.conf'

bash 'Install tmux plugins' do
  code "#{node['home']}/.tmux/plugins/tpm/bin/install_plugins"
  environment ({ 'TMUX_PLUGIN_MANAGER_PATH' => "#{node['home']}/.tmux/plugins" })
end
