# Your should not store your Braintree credentials in source code. This is done for demonstration purposes.

# Instructions for accessing your api credentials can be found at:
# https://articles.braintreepayments.com/control-panel/important-gateway-credentials#api-credentials
Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = "use_your_merchant_id"
Braintree::Configuration.public_key  = "use_your_public_key"
Braintree::Configuration.private_key = "use_your_private_key"
