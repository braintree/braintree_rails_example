require 'rails_helper'

RSpec.describe "checkouts/new.html.erb", type: :view do
  it "renders the checkout header" do
    render
    expect(rendered).to match /Let's test a transaction/
  end

  it "includes the Braintree client token" do
    assign(:client_token, "your_client_token")
    render
    expect(rendered).to match /your_client_token/
  end

  it "includes the checkout form" do
    render
    expect(rendered).to match /<form id="payment-form"/
  end

  it "includes the amount input field" do
    render
    expect(rendered).to match /<label for="amount"/
    expect(rendered).to match /<input id="amount" name="amount" type="tel" min="1" placeholder="Amount"/
  end

  it "includes the dropin payment-form div" do
    render
    expect(rendered).to match /<div id="bt-dropin"/
  end
end
