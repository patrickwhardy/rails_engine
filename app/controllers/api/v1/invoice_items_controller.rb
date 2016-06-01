class Api::V1::InvoiceItemsController < Api::BaseController
  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find(params[:id])
  end
end
