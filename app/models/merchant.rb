class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  validates_presence_of :name

  def self.paid_invoices
    joins(:transactions).where(transactions: {result: "success"})
  end

  def favorite_customer
    customer_with_transactions = customers.select("customers.*, count(invoices.customer_id) as transactions_count")
    customer_with_transactions.paid_invoices.group("customers.id").order("transactions_count").last
  end

  def revenue(date)
    if date.nil?
      invoices.paid.joins(:invoice_items).sum('quantity*unit_price')
    else
      revenue = invoices.paid.where(created_at: date).joins(:invoice_items).sum('quantity*unit_price')
    end
  end

  def customers_with_pending_invoices
    customer_ids = invoices.pending.pluck(:customer_id)
    Customer.find(customer_ids)
  end

  def self.total_revenues(date)
    Invoice.paid.where(created_at: date).joins(:invoice_items).sum('quantity*unit_price')
  end
end
