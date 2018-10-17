FROM ruby:2.5

RUN apt-get update -qq && apt install -y build-essential libpq-dev nodejs
RUN mkdir /myapp

WORKDIR /myapp

COPY ./myapp/Gemfile /myapp/Gemfile
COPY ./myapp/Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

COPY ./myapp /myapp

RUN mkdir -p tmp/sockets

CMD bundle exec puma -C config/puma.rb
