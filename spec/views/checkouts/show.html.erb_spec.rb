require 'rails_helper'
require 'support/mock_data'

RSpec.describe "checkouts/show.html.erb", type: :view do
  include_context 'mock_data'

  before(:each) do
    assign(:transaction, mock_transaction)
  end

  it "renders the Transaction header" do
    render
    expect(rendered).to match /Transaction/
  end

  it "includes the transaction id" do
    render
    expect(rendered).to match /my_id/
  end

  it "includes the Credit Card Details" do
    render
    expect(rendered).to match /Credit Card Details/
  end

  it "includes the Customer Details" do
    render
    expect(rendered).to match /Customer Details/
  end
end

