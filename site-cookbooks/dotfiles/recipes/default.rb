git node['dotfiles_clone'] do
  repository 'https://github.com/abesto/dotfiles'
  user node['user']
  enable_submodules true
end

symlink_dotfile 'bin'
