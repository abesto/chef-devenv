package 'virtualbox-guest-utils-nox' do
  action :remove
end
package 'virtualbox-guest-utils'
package 'virtualbox-guest-modules-arch'

service 'vboxservice' do
  action [:enable, :start]
end

group 'vboxsf' do
  action :modify
  members node['user']
  append true
end
