FROM ruby:2.3.1-onbuild

RUN apt-get update

RUN bundle install
