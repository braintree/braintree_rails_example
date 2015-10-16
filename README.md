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
