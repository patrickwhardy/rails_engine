class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :invoice_id, :quantity, :created_at, :updated_at, :unit_price

  def unit_price
   "#{format("%.2f", object.unit_price/100.0)}"
  end
end
