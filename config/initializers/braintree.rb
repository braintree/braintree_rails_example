Dotenv.load

if !ENV["BT_ENVIRONMENT"] || !ENV["BT_MERCHANT_ID"] || !ENV["BT_PUBLIC_KEY"] || !ENV["BT_PRIVATE_KEY"]
  raise "Cannot find necessary environmental variables. See https://github.com/braintree/braintree_rails_example#setup-instructions for instructions";
end
