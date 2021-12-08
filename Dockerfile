# Dockerfile.rails
FROM ruby:3.0.2
# Note: mysql-client (for Ubuntu) has been change inside base image of Ruby docker (as using Debian 10)
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client

WORKDIR /rail-server
COPY . /rail-server/

RUN bundle install


EXPOSE 3000

# Configure the main process to run when running the image
# 
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]