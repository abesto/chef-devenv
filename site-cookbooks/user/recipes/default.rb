user node['user']

group 'wheel' do
  action :modify
  members node['user']
  append true
end

sudo_group 'wheel'
