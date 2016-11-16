Currently has VirtualBox-guest-specific features, might get smarter over time

## Installing

#### As root

```sh
git clone https://github.com/abesto/chef-devenv.git
cd chef-devenv
sudo chef-solo -c solo.rb -j nodes/arch.json
pacman -Syu
passwd
passwd abesto   # or whatever you set as node['user']
reboot -now
```

#### As abesto (or whatever you set as node['user']

```sh
systemctl --user enable emacs.service
sudo reboot
```
