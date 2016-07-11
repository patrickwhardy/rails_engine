require "rails_helper"

RSpec.describe "GET /api/v1/invoices" do
  it "returns index of invoices" do
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)

    get "/api/v1/invoices"
    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq 2
    invoice_json = invoices.first
    expect(invoice_json["id"]).to eq invoice1.id
    expect(invoice_json["customer_id"]).to eq invoice1.customer_id
    expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
    expect(invoice_json["status"]).to eq invoice1.status
  end
end
