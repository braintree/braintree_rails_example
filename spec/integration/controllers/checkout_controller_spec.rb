require 'spec_helper'
require 'rails_helper'

RSpec.describe CheckoutController, type: :controller do
  render_views

  describe "GET #index" do
    it "retrieves the Braintree client token and adds it to the page" do
      get :index
      client_token = assigns(:client_token)
      expect(client_token).to_not be_nil
      expect(response.body).to match /#{client_token}/
    end
  end
end
