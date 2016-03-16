class CheckoutsController < ApplicationController
  def new
    @client_token = Braintree::ClientToken.generate
  end

  def show
    @result = flash[:transaction_result]
    @transaction = Braintree::Transaction.find(params[:id])
  end

  def create
    amount = params["amount"] # In production you should not take amounts directly from clients
    nonce = params["payment_method_nonce"]

    result = Braintree::Transaction.sale(
      amount: amount,
      payment_method_nonce: nonce,
    )

    if result.success?
      flash[:transaction_result] = {
        :header => "Sweet Success!",
        :icon => "success",
        :result => "Your test transaction has been successfully processed. See the Braintree API response and try again."
      }
      redirect_to checkout_path(result.transaction.id)
    elsif result.transaction
      flash[:transaction_result] = {
        :header => "Transaction Failed",
        :icon => "fail",
        :result => "Your test transaction has a status of #{result.transaction.status}. See the Braintree API response and try again."
      }
      redirect_to checkout_path(result.transaction.id)
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
      redirect_to new_checkout_path
    end
  end
end
