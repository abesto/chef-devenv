require "chef/resource/script"
require "chef/provider/script"

class Chef
  class Provider
    class Fish < ::Chef::Provider::Script
      provides :fish
    end
  end
end
