include_recipe 'chef-sugar::default'
include_recipe 'nodejs'

if mac_os_x?
  homebrew_tap 'caskroom/fonts'
  homebrew_cask 'emacs-mac'
  homebrew_cask 'font-source-code-pro'
  homebrew_cask 'font-source-code-pro-for-powerline'
  nodejs_npm 'tern'
else
  package 'emacs'
  package 'adobe-source-code-pro-fonts'
  pacman_aur 'nodejs-tern' do
    environment({'HOME' => '/tmp'})
  end

  systemd_unit 'emacs.service' do
    content({
              'Unit' => {
                'Description' => 'Emacs: the extensible, self-documenting text editor'
              },
              'Service' => {
                'Type' => 'forking',
                'ExecStart' => '/usr/bin/emacs --daemon',
                'ExecStop' => '/usr/bin/emacsclient --eval \"(kill-emacs)\"',
                'Restart' => 'always',
              },
              'Install' => {
                'WantedBy' => 'default.target'
              }
            })
    user node['user']
    action [:create]  # Enable manually; user systemd session is not always available
  end
end

symlink_dotfile '.spacemacs'

git "#{node['home']}/.emacs.d" do
  repository 'https://github.com/syl20bnr/spacemacs'
  action :checkout
end
