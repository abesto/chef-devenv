module FishShellOut
  def fish_shellout(*args, **kwargs)
    kwargs[:user] = node['user'] unless kwargs.has_key?(:user)
    kwargs[:env] = {'HOME' => node['home'], 'USER' => kwargs[:user]}
    Mixlib::ShellOut.new('fish', '-c', *args, **kwargs)
  end
end
