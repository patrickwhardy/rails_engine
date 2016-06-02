class Api::V1::TransactionsFinderController < Api::BaseController

  def show
    if params[:result]
      respond_with Transaction.where("lower(result) = ?", params[:result].downcase).first
    else
      respond_with Transaction.find_by(invoice_item_params)
    end
  end

  def index
    if params[:result]
      respond_with Transaction.where("lower(result) = ?", params[:result].downcase)
    else
      respond_with Transaction.where(invoice_item_params)
    end
  end

  private

  def invoice_item_params
    params.permit(:id, :invoice_id, :credit_card_number, :created_at, :updated_at)
  end
end
