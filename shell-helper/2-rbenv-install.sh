# Download rbenv
if [ ! -d ~/.rbenv ]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
fi

cd ~/.rbenv
git reset --hard
git pull origin master


# Download ruby-build
if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

cd ~/.rbenv/plugins/ruby-build
git reset --hard
git pull origin master


# Setup rbenv
cd ~
export HOME=`pwd`
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

rbenv --version
rbenv versions
rbenv install --list



## To install a specific ruby version, run this command (This project use 3.0.2)
rbenv install 3.0.2