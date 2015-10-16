# braintree_rails_example
An example Braintree integration for Ruby on Rails

## Setup Instructions

1. Install bundler
   `gem install bundler`

2. Bundle
  `bundle`

3. Add your Braintree API credentials to `config/initializers/braintree.rb`
   Credentials can be found by navigating to Account > My user > View API Keys in the Braintree control panel.

4. Start rails
   `rails server`

## Running Tests

### Running Unit Tests

Unit tests do not make api calls to Braintree and do not require Braintree credentials. You can run this project's unit tests by
calling `rake` on the command line.

### Running Integration Tests

Integration tests make api calls to Braintree and require that you set up your Braintree credentials. You can run this project's integration tests by adding your sandbox api credentials to `config/initializers/braintree.rb` and calling `rake spec:integration` on the command line.

### Running All Tests

You can run both unit and integrations tests by calling `rake spec` on the command line.

## Disclaimer

This code is provided as is and is only intended to be used for illustration purposes. This code is not production-ready and is not meant to be used in a production environment. This repository is to be used as a tool to help merchants learn how to integrate with Braintree. Any use of this repository or any of its code in a production environment is highly discouraged.

## Pro Tips

 * Run `git update-index --assume-unchanged config/initializers/braintree.rb` to prevent yourself from committing your Braintree credentials.
 * Run `rails s -b 0.0.0.0` when launching Rails server to listen on all interfaces.
