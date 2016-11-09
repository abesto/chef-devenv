git node['dotfiles_clone'] do
  repository 'https://github.com/abesto/dotfiles'
  user node['user']
end

symlink_dotfile 'bin'
