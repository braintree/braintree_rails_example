require 'rails_helper'
require 'support/mock_data'

RSpec.describe CheckoutController, type: :controller do
  render_views
  include_context 'mock_data'

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "adds the Braintree client token to the page" do
      expect(Braintree::ClientToken).to receive(:generate).and_return("your_client_token")
      get :index
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
end
