Currently has VirtualBox-guest-specific features, might get smarter over time

## Run

### Using Vagrant

```sh
vagrant plugin install vagrant-berkshelf
vagrant up
```

### On an ArchLinux system with network configured

```sh
git clone https://github.com/abesto/chef-devenv.git
cd chef-devenv
sudo chef-solo -c solo.rb -j nodes/arch.json
```
