# Braintree Rails Example test

An example Braintree integration for Ruby on Rails.

> [!WARNING]
> Starting September 1, 2026 the Drop-in SDK will move to a [deprecated status](https://developer.paypal.com/braintree/docs/guides/client-sdk/deprecation-policy/javascript/v3/#status-categories) and we will no longer make any updates to this SDK. Processing will be supported for 1 year after the deprecation date, but you should upgrade immediately to avoid any disruption.
>
> Starting September 1, 2027 the Drop-in SDK will move to an [unsupported status](https://developer.paypal.com/braintree/docs/guides/client-sdk/deprecation-policy/javascript/v3/#status-categories) and will no longer be supported by Braintree developers or Braintree Support. Processing for unsupported SDKs can be suspended at any time.
>
> Please migrate to [Hosted Fields](https://developer.paypal.com/braintree/docs/start/tutorial-hosted-fields-node/) to continue processing and receiving updates.

## Setup Instructions

Install Ruby 4.0.7 and Node.js before starting.

1. Install bundler:

    ```sh
    gem install bundler
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
calling `bundle exec rake spec:unit` on the command line.

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
