require 'rails_helper'
require 'support/mock_data'

RSpec.describe CheckoutsController, type: :controller do
  render_views
  include_context 'mock_data'

  describe "GET #new" do
    it "returns http success" do
      expect(Braintree::ClientToken).to receive(:generate).and_return("your_client_token")
      get :new
      expect(response).to have_http_status(:success)
    end

    it "adds the Braintree client token to the page" do
      expect(Braintree::ClientToken).to receive(:generate).and_return("your_client_token")
      get :new
      expect(response.body).to match /your_client_token/
    end
  end

  describe "GET #show" do
    it "returns http success" do
      expect(Braintree::Transaction).to receive(:find).with("my_id").and_return(mock_transaction)

      get :show, id: "my_id"

      expect(response).to have_http_status(:success)
    end

    it "displays the transaction's fields" do
      expect(Braintree::Transaction).to receive(:find).with("my_id").and_return(mock_transaction)

      get :show, id: "my_id"

      expect(response.body).to match /my_id/
      expect(response.body).to match /sale/
      expect(response.body).to match /10\.0/
      expect(response.body).to match /authorized/
      expect(response.body).to match /ijkl/
      expect(response.body).to match /545454/
      expect(response.body).to match /5454/
      expect(response.body).to match /MasterCard/
      expect(response.body).to match /12\/2015/
      expect(response.body).to match /Bill Billson/
      expect(response.body).to match /US/
      expect(response.body).to match /h6hh3j/
      expect(response.body).to match /Bill/
      expect(response.body).to match /Billson/
      expect(response.body).to match /bill@example.com/
      expect(response.body).to match /Billy Bobby Pins/
      expect(response.body).to match /bobby_pins.example.com/
      expect(response.body).to match /1234567890/
    end
  end

  describe "POST #create" do
    it "returns http success" do
      amount = "10.00"
      nonce = "fake-valid-nonce"

      expect(Braintree::Transaction).to receive(:sale).with(
        amount: amount,
        payment_method_nonce: nonce,
      ).and_return(
        Braintree::SuccessfulResult.new(transaction: mock_transaction)
      )

      post :create, payment_method_nonce: nonce, amount: amount

      expect(response).to redirect_to("/checkouts/#{mock_transaction.id}")
    end

    context "when there are processor errors" do
      it "displays the transaction status" do
        amount = "2000"
        nonce = "fake-valid-nonce"

        expect(Braintree::Transaction).to receive(:sale).with(
          amount: amount,
          payment_method_nonce: nonce,
        ).and_return(processor_declined_result)

        post :create, payment_method_nonce: nonce, amount: amount

        expect(flash[:transaction_result][:result]).to eq("Your test transaction has a status of processor_declined. See the Braintree API response and try again.")
      end

      it "redirects to the transaction page" do
        amount = "2000"
        nonce = "fake-valid-nonce"

        expect(Braintree::Transaction).to receive(:sale).with(
          amount: amount,
          payment_method_nonce: nonce,
        ).and_return(processor_declined_result)

        post :create, payment_method_nonce: nonce, amount: amount

        expect(response).to redirect_to("/checkouts/#{processor_declined_result.transaction.id}")
      end
    end

    context "when braintree returns an error" do
      it "displays the errors" do
        amount = "not_a_valid_amount"
        nonce = "not_a_valid_nonce"

        expect(Braintree::Transaction).to receive(:sale).with(
          amount: amount,
          payment_method_nonce: nonce,
        ).and_return(sale_error_result)

        post :create, payment_method_nonce: nonce, amount: amount

        expect(flash[:error]).to eq([
          "Error: 81503: Amount is an invalid format.",
          "Error: 91565: Unknown payment_method_nonce.",
        ])
      end

      it "redirects to the new_checkout_path" do
        amount = "not_a_valid_amount"
        nonce = "not_a_valid_nonce"

        expect(Braintree::Transaction).to receive(:sale).with(
          amount: amount,
          payment_method_nonce: nonce,
        ).and_return(sale_error_result)

        post :create, payment_method_nonce: nonce, amount: amount

        expect(response).to redirect_to(new_checkout_path)
      end
    end
  end
end
