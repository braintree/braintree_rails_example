Dotenv.load

Braintree::Configuration.environment = ENV["BT_ENVIRONMENT"].try(:to_sym) || :sandbox
Braintree::Configuration.merchant_id = ENV["BT_MERCHANT_ID"]
Braintree::Configuration.public_key  = ENV["BT_PUBLIC_KEY"]
Braintree::Configuration.private_key = ENV["BT_PRIVATE_KEY"]
