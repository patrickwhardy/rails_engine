require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id" do
  it "returns an invoice" do
    invoice1 = create(:invoice)

    get "/api/v1/invoices/#{invoice1.id}"

    expect(response.status).to eq 200
    invoice_json = JSON.parse(response.body)
    expect(invoice_json["id"]).to eq invoice1.id
    expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
    expect(invoice_json["customer_id"]).to eq invoice1.customer_id
    expect(invoice_json["status"]).to eq invoice1.status
  end
end
