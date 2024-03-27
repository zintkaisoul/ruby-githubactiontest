# db-syncing

This is a project for synchronize data from a database to another database.

## Stack

-   main
-   Ruby (v3.0.2)
-   Rails (v)
-   MySQL ()

## 1. Installation

For installation, you will need to follow these step:

1. Install ruby and rvm

```
sudo apt install -y gcc gnupg2
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
cd ~
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 3.0.2
```

**Note**: If you prefer using rbenv, you can reference to this:

```
sudo apt install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel

chmod +x ./shell-helper/2-rbenv-install.sh
./shell-helper/2-rbenv-install.sh

```

For choose the correct path for ruby version, you may need to config the `.bashrc` by adding the line:

```
export PATH=~/.rbenv/shims:$PATH
```

2. Install mysql client

(Install client only -> can connect to a DB, but cannot host)

```
sudo apt-get install -y mysql-client libmysqlclient-dev
```

3. Clone source code to local

If haven't git, install git: 
```
sudo apt install -y git
```


Clone source code to local
```
cd ~
git clone https://github.com/kumcp/db-syncing.git
```

4. Install dependencies

```
cd ~/db-syncing
bundle install
```

5. Setup webpack

Before you can run this command, you will need to install node, npm, yarn:

```
sudo apt install nodejs npm -y
sudo npm install --global yarn
```

Install webpacker with:

```
bundle exec rake webpacker:install
```

5. If there's no problem installing dependencies, you can run the server with:

```
rails server -b 127.0.0.1 -p 3000
```

Note:
- Change to your local IP (private IP) if you host this on EC2.
- Change to 0.0.0.0 if want to bind address anywhere.
```
rails server -b 0.0.0.0 -p 3000
```

## Run with container

If you prefer to run the project as container, following this command:

```
docker-compose up

docker-compose up --build  # If you change anything in Dockerfile and want to rebuild all

docker-compose up --build <service_name> # If you want to rebuild only web sevice

docker-compose up -d --no-deps --build <service_name> # If you don't want to rebuil link services
```
