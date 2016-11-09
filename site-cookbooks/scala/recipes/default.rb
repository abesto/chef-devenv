include_recipe 'java'

package 'sbt'
pacman_aur 'scalastyle'
symlink_dotfile '.gradle/init.gradle'
symlink_dotfile '.sbt/0.13/plugins/plugins.sbt'
