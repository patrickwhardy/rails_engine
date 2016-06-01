require 'faker'

FactoryGirl.define do
  factory :customer do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    created_at DateTime.now - 1
    updated_at DateTime.now
  end

  factory :merchant do
    name Faker::Name.name
    created_at DateTime.now - 1
    updated_at DateTime.now
  end

  factory :invoice do
    customer
    merchant
    status "pending"
    created_at DateTime.now - 1
    updated_at DateTime.now
  end

  factory :item do
    name Faker::Name.name
    description Faker::Lorem.sentence(3)
    unit_price Random.rand(1..500000)
    merchant
    created_at DateTime.now - 1
    updated_at DateTime.now
  end

  factory :invoice_item do
    item
    invoice
    quantity Random.rand(1..50)
    unit_price Random.rand(1..500000)
    created_at DateTime.now - 1
    updated_at DateTime.now
  end
end
