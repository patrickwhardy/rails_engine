class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  validates_presence_of :merchant_id, :customer_id, :status

  def self.paid
    joins(:transactions).where(transactions: { result: "success" })
  end
end
