include_recipe 'java'

package 'sbt'

if mac_os_x?
  package 'scalastyle'
else
  # shit's on fire, yo
  #pacman_aur 'scalastyle'
end

symlink_dotfile '.gradle/init.gradle'
symlink_dotfile '.sbt/0.13/plugins/build.sbt'
symlink_dotfile '.sbt/0.13/plugins/plugins.sbt'
