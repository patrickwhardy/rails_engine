class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates_presence_of :name, :description, :unit_price, :merchant_id

  def best_day
    invoices.paid.select("invoices.created_at, sum(invoice_items.quantity) as items_sold").group("invoices.created_at").order("items_sold").last
  end

  def self.most_items(quantity)
    items_sold = select("items.*, sum(quantity) as items_sold")
    items_sold.joins(invoices: :transactions).where(transactions: {result: "success"}).group("items.id").order("items_sold DESC").first(quantity)
  end
end
