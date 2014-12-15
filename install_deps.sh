# Ruby
VERSION='1.9.3'

gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -L get.rvm.io | bash -s stable
rvm install $VERSION
rvm use --default $VERSION

# Tmuxinator
gem install --user-install tmuxinator

# Reflow
gem install --user-install reflow
