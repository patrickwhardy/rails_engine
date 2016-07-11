require "rails_helper"

RSpec.describe "GET /api/v1/customers/random" do
  include Helpers
  it "returns a random customer" do
    customer1 = create(:customer)
    customer2 = create(:customer)
    customer3 = create(:customer)

    get "/api/v1/customers/random"

    expect(response.status).to eq 200
    customer_json = JSON.parse(response.body)
    expect(customer_json["id"]).to_not be_nil
    expect(customer_json["first_name"]).to_not be_nil
    expect(customer_json["last_name"]).to_not be_nil
  end
end
