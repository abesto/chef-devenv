require "chef/resource/script"
require "chef/provider/script"

module SmartUser
  def user(arg = nil)
    retval = set_or_return(
      :user,
      arg,
      :kind_of => [ String, Integer ]
    )
    environment(environment.merge(
                  {'HOME' => ::Dir.home(@user),
                   'USER' => @user}
                ))
    guard_interpreter resource_name
    retval
  end
end

::Chef::Resource::Scm.send(:include, SmartUser)
::Chef::Resource::Script.send(:include, SmartUser)


class Chef
  class Resource
    class Fish < ::Chef::Resource::Script
      def initialize(name, run_context = nil)
        super
        @interpreter = "fish"
        @flags = '-l'
        @default_guard_interpreter = :fish
      end
    end
  end
end
