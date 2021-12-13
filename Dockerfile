FROM ruby:2.7.4

RUN apt-get update && apt-get install -y build-essential nodejs

ENV APP_HOME /braintree_rails_example
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME
