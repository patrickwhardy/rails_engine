class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  validates_presence_of :first_name, :last_name

  def self.paid_invoices
    joins(:transactions).where(transactions: {result: "success"})
  end

  def favorite_merchant
    merchant_transactions = merchants.select("merchants.*, count(invoices.merchant_id) as transactions_count")
    merchant_transactions.paid_invoices.group("merchants.id").order("transactions_count").last
  end
end
