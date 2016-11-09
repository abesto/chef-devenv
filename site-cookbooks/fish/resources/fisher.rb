resource_name :fisher_package

property :package, :name_property => true
property :source, :default => lazy { |r| r.name }

default_action :install

include ::FishShellOut

action :install do
  has_fisher = fish_shellout('functions -n | grep \'^fisher$\'')
  unless has_fisher.run_command.status == 0
    converge_by 'install fisherman' do
      fish 'install fisherman' do
        code 'curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher'
        user node['user']
      end
    end
  end

  has_pkg = fish_shellout("fisher ls | grep '^#{package}$'")
  unless has_pkg.run_command.status == 0
    converge_by "install fisher package \"#{source}\"" do

      fish "install fisher package #{source}" do
        code "fisher install #{source}"
        user node['user']
      end
    end
  end
end

action :uninstall do
  has_pkg = fish_shellout("fisher ls | grep '^#{package}$'")
  if has_pkg.run_command.status == 0
    converge_by "uninstall fisher package \"#{package}\"" do
      fish "uninstall fisher package #{name}" do
        code "fisher uninstall #{name}"
        only_if "fisher ls | grep -F '#{name}'"
        user node['user']
      end
    end
  end
end
