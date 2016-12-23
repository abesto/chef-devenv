include_recipe 'chef-sugar::default'

if mac_os_x?
  homebrew_cask 'java'
else
  package 'jdk8-openjdk'
  package 'openjdk8-doc'
  package 'openjdk8-src'
end

package 'maven'
