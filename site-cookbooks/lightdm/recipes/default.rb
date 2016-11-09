package 'lightdm'
package 'lightdm-gtk-greeter'

service 'lightdm' do
  action :enable
end

cookbook_file '/etc/lightdm/lightdm.conf' do
  source 'lightdm.conf'
end
