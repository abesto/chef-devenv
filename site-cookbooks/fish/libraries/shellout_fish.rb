module FishShellOut
  def fish_shellout(*args, **kwargs)
    kwargs[:user] = node['user'] unless kwargs.has_key?(:user)
    kwargs[:env] = {'HOME' => ::Dir.home(kwargs[:user]), 'USER' => kwargs[:user]}
    Mixlib::ShellOut.new('fish', '-c', *args, **kwargs)
  end
end
