include_recipe 'chef-sugar::default'

if mac_os_x?
  homebrew_cask 'java'
else
  package 'jdk8-openjdk'
end

package 'maven'
