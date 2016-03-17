RSpec.shared_context 'mock_data' do
  let(:mock_transaction) {
    double(Braintree::Transaction,
      id: "my_id",
      type: "sale",
      amount: "10.0",
      status: "authorized",
      created_at: 1.minute.ago,
      updated_at: 1.minute.ago,
      credit_card_details: double(
        token: "ijkl",
        bin: "545454",
        last_4: "5454",
        card_type: "MasterCard",
        expiration_date: "12/2015",
        cardholder_name: "Bill Billson",
        customer_location: "US",
      ),
      customer_details: double(
        id: "h6hh3j",
        first_name: "Bill",
        last_name: "Billson",
        email: "bill@example.com",
        company: "Billy Bobby Pins",
        website: "bobby_pins.example.com",
        phone: "1234567890",
        fax: nil,
      ),
    )
  }

  let(:mock_failed_transaction) {
    double(Braintree::Transaction,
      id: "my_id",
      type: "sale",
      amount: "10.0",
      status: "processor_declined",
      created_at: 1.minute.ago,
      updated_at: 1.minute.ago,
      credit_card_details: double(
        token: "ijkl",
        bin: "545454",
        last_4: "5454",
        card_type: "MasterCard",
        expiration_date: "12/2015",
        cardholder_name: "Bill Billson",
        customer_location: "US",
      ),
      customer_details: double(
        id: "h6hh3j",
        first_name: "Bill",
        last_name: "Billson",
        email: "bill@example.com",
        company: "Billy Bobby Pins",
        website: "bobby_pins.example.com",
        phone: "1234567890",
        fax: nil,
      ),
    )
  }

  let(:sale_error_result) {
    double(Braintree::ErrorResult,
      success?: false,
      message: "Amount is an invalid format. Unknown payment_method_nonce.",
      transaction: nil,
      errors: [
        OpenStruct.new(code: 81503, message: "Amount is an invalid format."),
        OpenStruct.new(code: 91565, message: "Unknown payment_method_nonce."),
       ]
    )
  }

  let(:processor_declined_result) {
    double(Braintree::ErrorResult,
      success?: false,
      transaction: OpenStruct.new(status: "processor_declined", id: "my_id"),
    )
  }
end
