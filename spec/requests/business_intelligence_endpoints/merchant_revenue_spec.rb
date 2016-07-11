require "rails_helper"

RSpec.describe "GET /api/v1/merchants/:id/revenue" do
  include Helpers
  it "returns a merchants revenue for invoices with a successful transaction" do
    merchant1 = create(:merchant)
    customer1 = create(:customer)
    customer2 = create(:customer)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
    invoice2 = create(:invoice, customer: customer2, merchant: merchant1)
    invoice3 = create(:invoice, customer: customer2, merchant: merchant1)

    invoice1.transactions << create(:transaction)
    invoice1.transactions << create(:transaction, result: "failed")
    invoice2.transactions << create(:transaction)
    invoice3.transactions << create(:transaction, result: "failed")
    invoice1.invoice_items << create(:invoice_item, quantity: 3, unit_price: 225)
    invoice2.invoice_items << create(:invoice_item, quantity: 1, unit_price: 4366)
    invoice2.invoice_items << create(:invoice_item, quantity: 2, unit_price: 5635)
    invoice3.invoice_items << create(:invoice_item, quantity: 5, unit_price: 550)

    date = invoice1.transactions.first.created_at
    get "/api/v1/merchants/#{merchant1.id}/revenue?date=#{date}"

    expect(response.status).to eq 200
    revenue_json = JSON.parse(response.body)
    expect(revenue_json["revenue"]).to eq "163.11"
  end

  it "returns a merchants revenue for invoices with a successful transaction" do
    merchant1 = create(:merchant)
    customer1 = create(:customer)
    customer2 = create(:customer)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
    invoice2 = create(:invoice, customer: customer2, merchant: merchant1)
    invoice3 = create(:invoice, customer: customer2, merchant: merchant1)

    invoice1.transactions << create(:transaction)
    invoice1.transactions << create(:transaction, result: "failed")
    invoice2.transactions << create(:transaction)
    invoice3.transactions << create(:transaction, result: "failed")
    invoice1.invoice_items << create(:invoice_item, quantity: 3, unit_price: 225)
    invoice2.invoice_items << create(:invoice_item, quantity: 1, unit_price: 4366)
    invoice2.invoice_items << create(:invoice_item, quantity: 2, unit_price: 5635)
    invoice3.invoice_items << create(:invoice_item, quantity: 5, unit_price: 550)

    date = invoice1.transactions.first.created_at
    get "/api/v1/merchants/#{merchant1.id}/revenue"

    expect(response.status).to eq 200
    revenue_json = JSON.parse(response.body)
    expect(revenue_json["revenue"]).to eq "163.11"
  end
end
