include_recipe 'chef-sugar::default'

package 'fish'

if mac_os_x?
  package 'fortune'
else
  package 'fortune-mod'
end

package 'most'

fisher_package 'z'
fisher_package 'rvm'
fisher_package 'metro' do
  source 'abesto/metro'
end

include_recipe 'dotfiles'
fisher_package 'abesto' do
  source "#{node['dotfiles_clone']}/fish-abesto"
end

exec_fish_priority = 99
bashrc 'exec-fish.sh' do
  priority exec_fish_priority
end
bashrc_skip 'exec-fish.sh' do
  priority exec_fish_priority
  flavor 'nofish'
end
