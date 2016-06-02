require 'faker'

FactoryGirl.define do
  factory :customer do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    created_at (DateTime.now - 1).to_s
    updated_at DateTime.now.to_s
  end

  factory :merchant do
    name Faker::Name.name
    created_at (DateTime.now - 1).to_s
    updated_at DateTime.now.to_s
  end

  factory :invoice do
    customer
    merchant
    status "pending"
    created_at (DateTime.now - 1).to_s
    updated_at DateTime.now.to_s
  end

  factory :item do
    name Faker::Name.name
    description Faker::Lorem.sentence(3)
    unit_price Random.rand(1..500000)
    merchant
    created_at (DateTime.now - 1).to_s
    updated_at DateTime.now.to_s
  end

  factory :invoice_item do
    item
    invoice
    quantity Random.rand(1..50)
    unit_price Random.rand(1..500000)
    created_at (DateTime.now - 1).to_s
    updated_at DateTime.now.to_s
  end

  factory :transaction do
    invoice
    credit_card_number "4444 4444 4444 4444"
    result "success"
    created_at (DateTime.now - 1).to_s
    updated_at DateTime.now.to_s
  end

  factory :merchant_with_items, parent: :merchant do |merchant|
    items { build_list :item, Random.rand(1..6) }
  end

  factory :merchant_with_invoices, parent: :merchant do |merchant|
    invoices { build_list :invoice, Random.rand(1..6) }
  end

  factory :customer_with_invoices, parent: :customer do |customer|
    invoices { build_list :invoice, Random.rand(1..6) }
  end

  factory :invoice_with_transactions, parent: :invoice do |invoice|
    transactions { build_list :transaction, Random.rand(1..6) }
  end

  factory :invoice_with_invoice_items, parent: :invoice do |invoice|
    invoice_items { build_list :invoice_item, Random.rand(1..6) }
  end

  factory :item_with_invoice_items, parent: :item do |item|
    invoice_items { build_list :invoice_item, Random.rand(1..6) }
  end
end
