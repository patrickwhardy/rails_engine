require "rails_helper"

RSpec.describe "GET /api/v1/customers/:id" do
  it "returns a customer" do
    customer1 = create(:customer)

    get "/api/v1/customers/#{customer1.id}"

    expect(response.status).to eq 200
    customer_response = JSON.parse(response.body)
    expect(customer_response["id"]).to eq customer1.id
    expect(customer_response["first_name"]).to eq customer1.first_name
    expect(customer_response["last_name"]).to eq customer1.last_name
  end
end
