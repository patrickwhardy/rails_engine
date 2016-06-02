class Api::V1::InvoicesFinderController < Api::BaseController
  def show
    if params[:status]
      respond_with Invoice.where("lower(status) = ?", params[:status].downcase).first
    else
      respond_with Invoice.find_by(invoice_params)
    end
  end

  def index
    if params[:status]
      respond_with Invoice.where("lower(status) = ?", params[:status].downcase)
    else
      respond_with Invoice.where(invoice_params)
    end
  end

  private

  def invoice_params
    params.permit(:id, :merchant_id, :customer_id, :created_at, :updated_at)
  end

end
