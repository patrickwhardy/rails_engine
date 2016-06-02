class Api::V1::InvoiceItemsRandomController < Api::BaseController
  def show
    respond_with InvoiceItem.order("RANDOM()").first
  end
end
