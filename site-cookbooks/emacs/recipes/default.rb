package 'emacs'
package 'adobe-source-code-pro-fonts'

# for nodejs code analysis; at time of writing, spacemacs is sad if not present
pacman_aur 'nodejs-tern' do
  environment({'HOME' => '/tmp'})
end

symlink_dotfile '.spacemacs'

git "#{node['home']}/.emacs.d" do
  repository 'https://github.com/syl20bnr/spacemacs'
  action :checkout
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
