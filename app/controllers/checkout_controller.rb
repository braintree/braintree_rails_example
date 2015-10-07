class CheckoutController < ApplicationController
  def index
    @client_token = Braintree::ClientToken.generate
  end

  def show
    @transaction = Braintree::Transaction.find(params[:id])
  end
end
