FROM ruby:2.3.1-onbuild

RUN apt-get update && apt-get install -y build-essential nodejs

ENV APP_HOME /braintree_rails_example
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME
