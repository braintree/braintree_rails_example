require 'rails_helper'

RSpec.describe "checkout/index.html.erb", type: :view do
  it "renders the checkout header" do
    render
    expect(rendered).to match /Checkout/
  end

  it "includes the Braintree client token" do
    assign(:client_token, "your_client_token")
    render
    expect(rendered).to match /your_client_token/
  end
end
