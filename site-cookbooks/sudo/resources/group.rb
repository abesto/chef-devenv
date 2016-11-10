default_action :create

action :create do
  include_recipe 'sudo'
  file "/etc/sudoers.d/chef_#{name}" do
    content "%#{name} ALL=(ALL) ALL\n"
  end
end

action :delete do
  file "/etc/sudoers.d/chef_#{name}" do
    action :delete
  end
end
