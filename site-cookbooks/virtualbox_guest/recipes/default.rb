package 'virtualbox-guest-utils'
package 'virtualbox-guest-modules-arch'

service 'vboxservice' do
  action [:enable, :start]
end
