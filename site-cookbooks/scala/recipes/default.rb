include_recipe 'java'

package 'sbt'

if mac_os_x?
  package 'scalastyle'
else
  pacman_aur 'scalastyle'
end

symlink_dotfile '.gradle/init.gradle'
symlink_dotfile '.sbt/0.13/plugins/plugins.sbt'
