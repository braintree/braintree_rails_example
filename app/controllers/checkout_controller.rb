class CheckoutController < ApplicationController
  def index
    @client_token = Braintree::ClientToken.generate
  end
end
