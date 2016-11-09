Currently has VirtualBox-guest-specific features, might get smarter over time

## Prereqs, notes

 * base 64-bit ArchLinux install with working network
 * chef solo

## Run

```sh
git clone https://github.com/abesto/chef-devenv.git
cd chef-devenv
sudo chef-solo -c solo.rb -j nodes/arch.json
```
