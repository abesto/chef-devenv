Vagrant.configure('2') do |config|
  config.vm.box = 'ogarcia/archlinux-x64'

  # Upgrade all pre-installed packages
  config.vm.provision 'shell', inline: 'pacman -Syu --noconfirm'

  # Install Chef DK - Vagrant doesn't know how to install Chef on Arch
  config.vm.provision 'shell', inline: <<-EOL
set -xeuo pipefail
builddir="$(mktemp -d)"
cd "$builddir"
curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/chef-dk.tar.gz
tar -xvf chef-dk.tar.gz
chown -R nobody .
cd chef-dk
sudo -u nobody makepkg -s
pacman --noconfirm -U chef-dk*.tar.xz
cd /
rm -rf "$builddir"
  EOL

  # Provision with chef
  config.berkshelf.enabled = true
  config.vm.provision 'chef_solo' do |chef|
    chef.install = false
    chef.cookbooks_path = ['site-cookbooks', 'berks-cookbooks']
    chef.roles_path = 'roles'
    chef.add_role('arch-virtualbox')
  end

  config.vm.provider 'virtualbox' do |v|
    v.gui = true
    v.name = 'devenv'
    v.memory = 4096
    v.cpus = 4
  end
end
