property :flavor, :name_property => true

default_action :create

action :create do
  symlink_dotfile '.bashrc' do
    location ".bashrc-#{flavor}"
  end
end
