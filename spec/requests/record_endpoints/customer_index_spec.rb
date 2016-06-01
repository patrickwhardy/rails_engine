require 'rails_helper'

RSpec.describe "GET api/v1/customers.json" do
  it "returns index of customers" do
    customer1 = create(:customer)
    customer2 = create(:customer)
    customer3 = create(:customer)

    get "/api/v1/customers.json"

    expect(response.status).to eq 200
    customers = JSON.parse(response.body)
    expect(customers.count).to eq 3

    customers_response = customers.first
    expect(customers_response["id"]).to eq customer1.id
    expect(customers_response["first_name"]).to eq customer1.first_name
    expect(customers_response["last_name"]).to eq customer1.last_name
  end
end
