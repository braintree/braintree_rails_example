# Braintree Rails Example test

An example Braintree integration for Ruby on Rails.

## Setup Instructions

1. Install bundler:

    ```sh
    gem install bundler
    ```
1. You may need to install `postgresql` (a production dependency) and `mimemagic`. On a mac using Homebrew, run these commands:

```
brew install shared-mime-info
brew install postgresql
```

1. Bundle:

    ```sh
    bundle
    ```

1. Copy the contents of `example.env` into a new file named `.env` and fill in your Braintree API credentials. Credentials can be found by navigating to Account > My User > View Authorizations in the Braintree Control Panel. Full instructions can be [found on our support site](https://articles.braintreepayments.com/control-panel/important-gateway-credentials#api-credentials).

1. Start rails:

    ```sh
    rails server
    ```

## Running Tests

### Running Unit Tests

Unit tests do not make API calls to Braintree and do not require Braintree credentials. You can run this project's unit tests by
calling `rake` (or `rails -R spec`) on the command line.

### Running Integration Tests

Integration tests make API calls to Braintree and require that you set up your Braintree credentials. You can run this project's integration tests by adding your sandbox API credentials to `.env` and calling `rake spec:integration` (or `rails spec:integration`) on the command line.

### Running All Tests

You can run both unit and integrations tests by calling `rake spec` (or `rails spec`) on the command line.

## Testing Transactions

Sandbox transactions must be made with [sample credit card numbers](https://developers.braintreepayments.com/reference/general/testing/ruby#credit-card-numbers), and the response of a `Braintree::Transaction.sale()` call is dependent on the [amount of the transaction](https://developers.braintreepayments.com/reference/general/testing/ruby#test-amounts).

## Pro Tips

 * Run `rails s -b 0.0.0.0` when launching Rails server to listen on all interfaces.

## Help

 * Found a bug? Have a suggestion for improvement? Want to tell us we're awesome? [Submit an issue](https://github.com/braintree/braintree_rails_example/issues)
 * Trouble with your integration? Contact [Braintree Support](https://support.braintreepayments.com/) / support@braintreepayments.com
 * Want to contribute? [Submit a pull request](https://help.github.com/articles/creating-a-pull-request)

## Disclaimer

This code is provided as is and is only intended to be used for illustration purposes. This code is not production-ready and is not meant to be used in a production environment. This repository is to be used as a tool to help merchants learn how to integrate with Braintree. Any use of this repository or any of its code in a production environment is highly discouraged.
