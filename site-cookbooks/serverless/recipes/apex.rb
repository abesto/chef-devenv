include_recipe 'nodejs'

pacman_aur 'terraform' do
  action :sync
end

bash 'install apex' do
  code 'curl https://raw.githubusercontent.com/apex/apex/master/install.sh | sh'
  not_if { ::File.exists? '/usr/local/bin/apex' }
end
