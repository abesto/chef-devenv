bash 'set colemak locale' do
  code <<-EOH
     localectl set-x11-keymap us pc104 colemak
     localectl set-keymap colemak
  EOH

  not_if {
    output = Mixlib::ShellOut.new('localectl').run_command.stdout
    lines = output.split("\n").map{ |s| s.strip }
    ['VC Keymap: colemak', 'X11 Layout: us', 'X11 Model: pc104', 'X11 Variant: colemak'].all? { |entry|
      lines.include?(entry)
    }
  }
end
