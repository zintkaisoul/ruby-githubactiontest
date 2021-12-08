# db-syncing

This is a project for synchronize data from a database to another database.

## Stack

-   Ruby (v3.0.2)
-   Rails (v)
-   MySQL ()

## 1. Installation

For installation, you will need to follow these step:

1. Install ruby and rbenv (version manager)

```
sudo yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel

chmod +x ./shell-helper/2-rbenv-install.sh
./shell-helper/2-rbenv-install.sh

```

For choose the correct path for ruby version, you may need to config the `.bashrc` by adding the line:

```
export PATH=~/.rbenv/shims:$PATH
```

2. Install mysql

(Install client only -> can connect to a DB, but cannot host)

```
sudo apt-get install mysql-client libmysqlclient-dev
```

3. Install dependencies

```
bundle install
```

4. Setup

```
bundle exec rake webpacker:install
```

5. If there's no problem installing dependencies, you can run the server with:

```
rails server -b 127.0.0.1 -p 3000
```

## Run with container

If you prefer to run the project as container, following this command:

```
docker-compose up

docker-compose up --build  # If you change anything in Dockerfile and want to rebuild all

docker-compose up --build <service_name> # If you want to rebuild only web sevice

docker-compose up -d --no-deps --build <service_name> # If you don't want to rebuil link services
```
