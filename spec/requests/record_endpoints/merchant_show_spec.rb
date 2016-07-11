require "rails_helper"

RSpec.describe "GET /api/v1/merchants/:id" do
  it "returns a single merchant" do
    merchant1 = create(:merchant)

    get "/api/v1/merchants/#{merchant1.id}"

    expect(response.status).to eq 200
    merchant_json = JSON.parse(response.body)
    expect(merchant_json["id"]).to eq merchant1.id
    expect(merchant_json["name"]).to eq merchant1.name
  end
end
