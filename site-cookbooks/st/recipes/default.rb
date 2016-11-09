pacman_aur 'st-git' do
  patches ['config.h.patch']
  action [:build, :install]
  pkgbuild_src 'PKGBUILD'
end
