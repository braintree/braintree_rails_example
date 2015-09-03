require 'rails_helper'

RSpec.describe CheckoutController, type: :controller do
  render_views

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
end
