#!/usr/local/bin/fish
rvm 2.3.1@devenv
rvmsudo chef-solo -c ./solo.rb -j nodes/osx.json
