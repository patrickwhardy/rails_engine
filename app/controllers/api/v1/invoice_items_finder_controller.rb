class Api::V1::InvoiceItemsFinderController < Api::BaseController
  def show
    respond_with InvoiceItem.find_by(invoice_item_params)
  end

  def index
    respond_with InvoiceItem.where(invoice_item_params)
  end

  private

  def unit_price_to_dollars
    params[:unit_price] = params[:unit_price].split('.').join.to_i
  end

  def invoice_item_params
    unit_price_to_dollars if params[:unit_price]
    params.permit(:id, :invoice_id, :item_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end
